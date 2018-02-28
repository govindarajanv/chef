#
# Cookbook:: app_service
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# install java
package 'java-1.8.0-openjdk.x86_64'
package 'java-1.8.0-openjdk-devel.x86_64'

# update /etc/environment
ruby_block "update environment file" do
  block do
    file = Chef::Util::FileEdit.new("/etc/environment")
    file.insert_line_if_no_match("/JAVA_HOME/", "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/bin/java")
    file.write_file
  end
end

execute 'check pwd' do
  command 'echo $(pwd) > log.time'
end
# update  bash profile
bash_file = "#{ENV['HOME']}/.bash_profile"
print bash_file
ruby_block "update environment file" do
  block do
    file = Chef::Util::FileEdit.new("#{ENV['HOME']}/.bash_profile")
    file.insert_line_if_no_match("/JAVA_HOME=/", "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/bin/java")
    file.insert_line_if_no_match("/PATH=\$JAVA_HOME\/bin/", "export PATH=\$JAVA_HOME\/bin:\$PATH")
    file.write_file
  end
end

# refresh bash profile
execute 'refresh bash profile' do
  command 'sh #{bash_file}'
end


# install tomcat

package 'tomcat'

#Create users for accessing manager
template '/etc/tomcat/tomcat-users.xml' do
  source 'tomcat-users.xml.erb'
  owner 'root'
  group 'tomcat'
  mode '0644'
  notifies :reload, 'service[tomcat]'
end

# Tomcat configuration
execute 'Add a group for Tomcat' do
  command 'groupadd tomcat'
  not_if 'cat /etc/group|grep tomcat'
end

execute 'Add a user for Tomcat' do
  command 'useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat'
  not_if 'cat /etc/passwd|grep tomcat'
end

execute 'change directory permission' do
  command 'chown -R tomcat:tomcat /usr/share/tomcat'
  command 'chown -R tomcat:tomcat /etc/tomcat/conf'
  command 'chown g+rwx /etc/tomcat/conf'
  command 'chmod g+r /etc/tomcat/conf/*'
  command 'chown -R tomcat:tomcat /var/log/tomcat /var/cache/tomcat/temp /var/lib/tomcat/webapps /var/cache/tomcat/work /usr/share/java/tomcat'
  command 'chown -R tomcat:tomcat /usr/share/tomcat/bin'
  command 'chmod g+rwx /usr/share/tomcat/bin'
  command 'chmod g+r /usr/share/tomcat/bin/*'
end

# create a root directory and index file
directory '/var/lib/tomcat/webapps/ROOT' do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end
file '/var/lib/tomcat/webapps/ROOT/index.html' do
  content '<html> <h1> This is the test page for the web application. </h1> </html>'
  mode '0755'
  owner 'tomcat'
  group 'tomcat'
end

#Deploy a sample war file
remote_file '/var/lib/tomcat/webapps/sample.war'do
  source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end

package 'tomcat-webapps'
package 'tomcat-admin-webapps'

service 'tomcat' do
	action [:enable, :start]
end
