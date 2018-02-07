#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
# chef generate lwrp manageJenkins
# referred http://novicejava1.blogspot.in/2017/09/install-configure-jenkins-chef.html

template '/etc/yum.repos.d/jenkins.repo' do
                source 'jenkins.repository.erb'
                owner 'root'
                group 'root'
                mode '0755'
end
manageJenkins 'install' do
                action    :install
end
service 'jenkins' do
	action [:enable, :start]
end
