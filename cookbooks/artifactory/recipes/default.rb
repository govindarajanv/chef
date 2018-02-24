#
# Cookbook:: artifactory
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/etc/yum.repos.d/artifactory.repo' do
                source 'artifactory.repo.erb'
                owner 'root'
                group 'root'
                mode '0755'
end
manageArtifactory 'install' do
                action    :install
end
service 'artifactory' do
        action [:enable, :start]
end#
