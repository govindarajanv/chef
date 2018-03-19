reboot 'software install' do
	action :reboot_now
	reason 'needs rebooting after installation of the software'
	only_if 'if ((Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "MySQL Query Browser 1.1"}).Version -eq "1.1.20") { Return $True } Return $False'
end
