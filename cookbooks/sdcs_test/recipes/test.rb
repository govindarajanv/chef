#Add the three lines below as these are global variables
#
$version_old = ''
$version_new = ''
$reboot_flag = false

#The below line can be ignored in the implementation
node.default['sdcs']['package']['windows'] = 'C:\Users\vishnuch\Downloads\txpeng812-64\setup.exe'
#remote_file "#{ENV['tmp']}\\agent.exe" do
#	source node['sdcs']['package']['windows']
#	action :create
#end  

#cookbook_file "#{ENV['tmp']}\\agent-cert.ssl" do   
#  source node['sdcs']['ssl_cert']   
#  action :create 
#end  

ruby_block 'getting old version' do
   block do
	#This is for reading the version before installation
	data_from_file = IO.readlines('D:\Code\chef\cookbooks\sdcs_test\sis-version.properties')
	$version_old = data_from_file[0].to_s.partition('=')[2]
	puts $version_old
   end
end


#Execute block
#execute 'install sdcs agent on windows'  do
#	command "C:\Users\vishnuch\Downloads\txpeng812-64\setup.exe /v\"/qn\""
#	action :run
#	returns[0,3010]
#end

windows_package 'Textpad8' do
	source 'C:\Users\vishnuch\Downloads\txpeng812-64\setup.exe'
	installer_type :custom_type
	options '/v/qn'
end

 ruby_block 'getting new version' do
     block do

	#This is for reading the version after installation
	data_from_file = IO.readlines('D:\Code\chef\cookbooks\sdcs_test\sis-version.properties')
	$version_new = data_from_file[0].to_s.partition('=')[2]
	puts $version_new
     end
 end

reboot 'sdcs install' do
  action :request_reboot
  reason 'Reboot required as new version is installed'
  delay_mins 15
  only_if  { $version_old != $version_new }
end
