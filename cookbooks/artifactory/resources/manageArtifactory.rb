# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :manageArtifactory

action :install do
                package 'jfrog-artifactory-oss'

                service 'jfrog-artifactory-oss' do
                                action [:enable, :start]
                end
end

action :uninstall do
                package 'jfrog-artifactory-oss' do
                                action :remove
                end
end
