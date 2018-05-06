Use generators to configure your actions and file customizations when you execute 'chef generate'
-	mkdir generator
-	chef generate generator generator/lcd_origin
-	Inspect the files and make changes
	-	change kitchen.yml.erb to use docker instead of vagrant if you want
-	Add the following code to the file files/default/spec_helper.rb	
	RSpec.configure do |config|
  		config.platform = 'centos'
  		config.version = '7.2.1511'
	end
-	create a directory in lcd_origin folder called .chef and place a config.rb file
	cookbook_path [ '~/chef/cookbooks/']
	local_mode true
	if File.basename($PROGRAM_NAME).eql?('chef') && ARGV[0].eql?('generate')
	  chefdk.generator.license = "all_rights"
	  chefdk.generator.copyright_holder = "Govindarajan V"
	  chefdk.generator_cookbook = "/home/user/cookbooks/lcd_origin"
	  chefdk.generator.email = "govindarajanv@gmail.com"
	  chefdk.generator_cookbook = "~/generator/lcd_origin"
	end	
-	mkdir -p chef/cookbooks
-	chef generate cookbook cookbooks/my_web
