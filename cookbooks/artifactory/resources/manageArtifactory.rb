# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :manageArtifactory

action :install do
                package 'artifactory'

                service 'artifactory' do
                                action [:enable, :start]
                end
end

action :uninstall do
                package 'artifactory' do
                                action :remove
                end
end
