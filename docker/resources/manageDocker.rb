resource_name :manageDocker

action :install do
                package 'docker'

                service 'docker' do
                                action [:enable, :start]
                end
end

action :uninstall do
                package 'docker' do
                                action :remove
                end
end
