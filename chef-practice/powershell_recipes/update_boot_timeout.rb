powershell_script 'update boot timeout' do
  code <<-EOH
  bcdedit /timeout 25
  EOH
end
