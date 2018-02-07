template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'service[httpd]'
end

# Enable and Start Apache webserver; Support Reloading httpd
service 'httpd' do
  supports enable: true, start: true, reload: true
  action [:enable, :start]
end
