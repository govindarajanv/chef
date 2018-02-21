template '/etc/yum.repos.d/logstash.repo' do
                source 'logstash.repo.erb'
                owner 'root'
                group 'root'
                mode '0755'
end
manageLogstash 'install' do
                action    :install
end
service 'logstash' do
        action [:enable, :start]
end

#firewalld_port '9200/tcp' do
#	action :add
#end
