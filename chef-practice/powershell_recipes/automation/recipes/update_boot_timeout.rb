powershell_script 'update boot timeout' do
  code <<-EOH
  bcdedit /timeout 5
  EOH
end
