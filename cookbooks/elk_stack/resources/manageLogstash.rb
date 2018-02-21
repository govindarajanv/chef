# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :manageLogstash
action :install do
                package 'logstash'
                service 'logstash' do
                                action [:enable, :start]
                end
end
action :uninstall do
                package 'logstash' do
                                action :remove
                end
end
