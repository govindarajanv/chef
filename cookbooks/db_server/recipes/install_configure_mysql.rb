remote_file '/tmp/mysql57-community-release-el7-7.noarch.rpm' do
	source  "http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm"
end

yum_package 'mysql57-community-release' do
	source '/tmp/mysql57-community-release-el7-7.noarch.rpm'
	action :install
end

bash 'other installation steps' do
  code <<-EOH
    yum repolist enabled | grep "mysql.*-community.*" && yum install mysql-community-server -y && yum-config-manager --disable mysql57-community && yum-config-manager --enable mysql56-community
    EOH
end

bash 'enable repolist' do
  code <<-EOH
    yum repolist enabled | grep "mysql.*-community.*" 
    EOH
end

bash 'instal mysql community server' do
  code <<-EOH
    yum install mysql-community-server -y 
    EOH
end

bash 'enable and disable yum config manager' do
  code <<-EOH
    yum-config-manager --disable mysql57-community && yum-config-manager --enable mysql56-community
    EOH
end

service 'mysqld' do
    action [:enable, :start]
end
