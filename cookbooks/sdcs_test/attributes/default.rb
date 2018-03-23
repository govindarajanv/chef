# SDCS attributes 
# agent source default['sdcs']['package']['rhel_5'] = 'https://core-optum-sdcs-install-container.ooss.uhc.com/current/agent64-linux-rhel5.bin' 
default['sdcs']['package']['rhel_6'] = 'https://core-optum-sdcs-install-container.ooss.uhc.com/current/agent64-linux-rhel6.bin' 
default['sdcs']['package']['rhel_7'] = 'https://core-optum-sdcs-install-container.ooss.uhc.com/current/agent64-linux-rhel7.bin' 
default['sdcs']['package']['windows'] = 'C:\Users\vishnuch\Downloads\txpeng812-64\setup.exe'
# common parameter ssl certificate filename 
#default['sdcs']['ssl_cert'] = 'agent-cert.ssl' 
# 6.7 mp3 versions 
default['sdcs']['package_version']['rhel_5'] = '5.2.9-990' 
default['sdcs']['package_version']['rhel_6'] = '6.7.3-1473' 
default['sdcs']['package_version']['rhel_7'] = '6.7.3.1473' 
# windows agent related configuraiton 
default['sdcs']['management_server'] = 'apsed4802.ms.ds.uhc.com' 
# default['sdcs']['alt_management_servers'] = '' 
# linux agent related configuration # altservers
