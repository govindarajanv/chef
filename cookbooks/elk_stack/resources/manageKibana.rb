# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :manageKibana
action :install do
                package 'kibana'
                service 'kibana' do
                                action [:enable, :start]
                end
end
action :uninstall do
                package 'kibana' do
                                action :remove
                end
end
