template '/etc/yum.repos.d/elasticsearch.repo' do
                source 'elasticsearch.repo.erb'
                owner 'root'
                group 'root'
                mode '0755'
end
manageElasticsearch 'install' do
                action    :install
end
service 'elasticsearch' do
        action [:enable, :start]
end

#firewalld_port '9200/tcp' do
#	action :add
#end
