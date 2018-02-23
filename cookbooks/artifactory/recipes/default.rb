#
# Cookbook:: artifactory
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/etc/yum.repos.d/artifactory.repo' do
                source 'artifactory.repository.erb'
                owner 'root'
                group 'root'
                mode '0755'
end
manageArtificatory 'install' do
                action    :install
end
service 'artifactory' do
        action [:enable, :start]
end#
