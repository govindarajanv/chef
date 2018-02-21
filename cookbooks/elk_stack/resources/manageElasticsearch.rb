# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :manageElasticsearch
action :install do
                package 'elasticsearch'
                service 'elasticsearch' do
                                action [:enable, :start]
                end
end
action :uninstall do
                package 'elasticsearch' do
                                action :remove
                end
end
