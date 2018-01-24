#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
template '/etc/yum.repos.d/docker.repo' do
                source 'docker.repository.erb'
                owner 'root'
                group 'root'
                mode '0755'
end
manageDocker 'install' do
                action    :install
end
service 'docker' do
	action [:enable, :start]
end
