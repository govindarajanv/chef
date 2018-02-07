# Debug
default['haproxy']['debug'] = false

# keepalived
default['haproxy']['keepalived']['enable'] = false

# Proxies
default['haproxy']['proxies'] = nil

#default node object variables
default['haproxy']['backend']['load_balancing_method'] = 'roundrobin'
default['haproxy']['backend']['app_name'] = nil
default['haproxy']['backend']['ip_addr'] = nil
default['haproxy']['backend']['port_num'] = nil
