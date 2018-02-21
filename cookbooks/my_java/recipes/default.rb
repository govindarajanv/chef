#
# Cookbook Name:: my_java
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
#
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
  command 'echo $HOME >> log.time'
end
# update  bash profile
ruby_block "update environment file" do
  block do
    filename = ENV['HOME'] + "/.bash_profile"
    file = Chef::Util::FileEdit.new(filename)
    file.insert_line_if_no_match("/JAVA_HOME=/", "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/bin/java")
    file.insert_line_if_no_match("/PATH=\$JAVA_HOME\/bin/", "export PATH=\$JAVA_HOME\/bin:\$PATH")
    file.write_file
  end
end

# refresh bash profile
execute 'refresh bash profile' do
  command 'sh $HOME/.bash_profile'
end
