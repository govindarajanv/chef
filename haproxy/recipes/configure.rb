template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'service[haproxy]'
end

# Enable and Start HAProxy; Support Reloading HAProxy
service 'haproxy' do
  supports enable: true, start: true, reload: true
  action [:enable, :start]
end
