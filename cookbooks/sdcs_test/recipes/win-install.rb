# SDCS windows install  
remote_file "#{ENV['tmp']}\\agent.exe" do   
  source node['sdcs']['package']['windows']   
  action :create 
end  
cookbook_file "#{ENV['tmp']}\\agent-cert.ssl" do   
  source node['sdcs']['ssl_cert']   
  action :create 
end  
#::chef::resource::powershell_script.send(:include,chef::mixin::powershell_out) 
#command_str="[IO.File]::ReadAllText("C:\Program Files (x86)\Symantec\Data Center Security Server\Agent\IPS\sis-version.properties")" 

powershell_script'getbefore' do   
   guard_interpreter :powershell_script   
   #getbefore=powershell_out(command_str).stdout   
   getbefore AS string:[system.IO.File]::ReadAllText("D:\sis-version.properties")   
   puts"" 
   print"getbefore of the software is:"   
   puts(getbefore)   
   puts""   
   node .run_state[‘getbefore’] = getbefore    
   #[IO.File]::ReadAllText("D:\sis-version.properties") 
end  
execute 'install sdcs agent on windows'  do

  #command "#{ENV['tmp']}\\agent.exe /s /v\"MANAGEMENT_SERVER=#{node['sdcs']['management_server']} SSL_CERT_FILE=#{ENV['tmp']}\\#{node['sdcs']['ssl_cert']} -l*v+! #{ENV['tmp']}\\SISAgentSetup.log /qn\""   
  
  returns[0,3010]   
  guard_interpreter :powershell_script   
  #notifies :request_reboot, 'reboot[sdcs install]'    
  #only_if "If ([IO.File]::ReadAllText("D:\sis-version.properties") -eq $null) { Return $True } Return $False"    
  only_if getbefore != ([system.IO.File]::ReadAllText("D:\sis-version.properties")    #only_if getbeore != Present sdcs file end  powershell_script'getafter' do   guard_interpreter :powershell_script   #getbefore=powershell_out(command_str).stdout   
  puts""   print"getafter of the software is:"   
  puts(getafter)   
  puts""   
  node.run_state['getafter']=[system.IO.File]::ReadAllText("D:\sis-version.properties") node.run_state['reboot_flag'] = false         
  if node.run_state['getbefore'] != node.run_state['getafter']                 
  node.run_state['reboot_flag'] = true
end  
  
#reboot 'sdcs install' do 
    
    #action :reboot_now reason 'Needs to reboot after installing sdcs agent'   
    #action :nothing
    #only_if node.run_state['reboot_flag'] 
    #'If ((Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "Symantec Data Center Security Server Agent"}) -eq "Symantec Data Center Security Server Agent") { Return $True } Return $False' 
#end 