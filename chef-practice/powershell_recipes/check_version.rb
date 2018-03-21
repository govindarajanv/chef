require "chef/mixin/powershell_out"
include Chef::Mixin::PowershellOut
 
class Chef
 class Resource
	include Chef::Mixin::PowershellOut
 end
end

powershell_script'set old version' do
	code <<-EOH
	(Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "Adobe AIR"}).Version
	$oldVersion='1.1.1'
	EOH
end

script = <<-EOH
(Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "Adobe AIR"}).Version
EOH
result1 = powershell_out(code)
print (result1)
#result2 = powershell_out(code)
#print (result2)

powershell_script 'set new version' do
	code <<-EOH
	$newVersion='1.1.2'
	$newVersion
	EOH
end
result = powershell_out(script)
print "result=", result
execute 'checking versions' do
	command "dir /p"
	guard_interpreter :powershell_script
	#only_if '$oldVersion != $NewVersion'
end
