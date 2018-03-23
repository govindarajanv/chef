ruby_block 'getting old version' do
   block do
        #This is for reading the version before installation
        data_from_file = IO.readlines('D:\Code\chef\cookbooks\sdcs_test\sis-version2.properties')
        $version_old = data_from_file[0].to_s.partition(':')[2]
        puts $version_old
   end
end
