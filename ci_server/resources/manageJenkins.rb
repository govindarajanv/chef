resource_name :manageJenkins

action :install do
                package 'jenkins'

                service 'jenkins' do
                                action [:enable, :start]
                end
end

action :uninstall do
                package 'jenkins' do
                                action :remove
                end
end
