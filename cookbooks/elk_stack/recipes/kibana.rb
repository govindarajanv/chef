template '/etc/yum.repos.d/kibana.repo' do
                source 'kibana.repo.erb'
                owner 'root'
                group 'root'
                mode '0755'
end
manageKibana 'install' do
                action    :install
end
service 'kibana' do
        action [:enable, :start]
end

#firewalld_port '5601/tcp' do
#	action :add
#end
