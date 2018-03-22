::Chef::Resource::PowershellScript.send(:include, Chef::Mixin::PowershellOut)
command_str="(Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'Adobe AIR'}).Version" 
powershell_script'set old version' do
	oldVersion = powershell_out(command_str).stdout
	puts " "
	print "Old Version of the package is:"
	puts (oldVersion)
	puts " "
	node.run_state['oldVersion'] = oldVersion
end


powershell_script 'set new version' do
	newVersion = powershell_out(command_str).stdout
	puts " "
	print "New Version of the package is:"
	print (newVersion)
	puts " "
	node.run_state['newVersion'] = newVersion

	node.run_state['reboot_flag'] = false
	if node.run_state['oldVersion'] != node.run_state['newVersion']
		node.run_state['reboot_flag'] = true
end
ruby 'reboot block' do
	puts "Inside reboot block"
	puts "old Version:"
	puts node.run_state['oldVersion']
	puts "new Version:"
end
