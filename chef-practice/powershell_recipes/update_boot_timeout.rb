#powershell_script 'update boot timeout' do
#  code <<-EOH
#  [System.IO.File]::ReadAllText('C:\Users\vishnuch\FileName.txt')
#  EOH
#end


if File.exist?('C:\Users\vishnuch\FileName.txt')
	contents = ::File.read('C:\Users\vishnuch\FileName.txt').chomp
	print contents
end
