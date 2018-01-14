#
# Cookbook Name:: ci_server
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
execute 'jenkins-setup' do
  cwd Chef::Config[:file_cache_path]
  command <<-EOF
    	yum install -y wget
	sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
	sudo rpm --import https://pkg.jenkins.io/redhat/jenkins-ci.org.key
	sudo yum install jenkins java-1.8.0-openjdk
    EOF
  not_if { ::File.exist?('/etc/yum.repos.d/CentOS-Base.repo') }
end
package 'nginx'
service 'nginx' do
	action [:enable, :start]
end
package 'elinks'
#https://github.com/poise/jenkins/blob/master/templates/default/proxy_nginx.conf.erb

bash 'selinux' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
  	setenforce 0
	yum install setroubleshoot-server selinux-policy-devel -y
	sepolicy -t http_port_t
	semanage port -a -t http_port_t =p tcp 8080
	sepolicy -t http_port_t
	setenforce 1
	getenforce
    EOH
  not_if { ::File.exist?(extract_path) }
end

service 'nginx' do
	action :restart
end

service 'jenkins' do
	action :restart
end
