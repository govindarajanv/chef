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
#/etc/ssl
#openssl req -x509 -days 365 -batch -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash_frwrd.crt
#/etc/logstash/conf.d/logstash.conf
#firewalld_port '5044/tcp' do
#	action :add
#end

