package 'elasticsearch'

service 'elasticsearch' do
	action [:enable, :start]
end

#firewalld_port '9200/tcp' do
#	action :add
#end
