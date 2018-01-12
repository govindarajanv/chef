# chef

**preparing the node**
**steps for boostrapping without password prompted for sudo privileges**
useradd admin
passwd admin
usermod -g wheel admin
groups admin
visudo
	## Allows people in group wheel to run all commands
	#%wheel ALL=(ALL)       ALL		##comment this out
	## Same thing without a password
	%wheel  ALL=(ALL)       NOPASSWD: ALL  ##uncomment this portion

**commands frequently used**

**To edit node file**
knife node edit webserver2
knife node from file webserver2.json

**Upload cookbooks**
update version in metadata.rb 
berks install
berks upload
knife cookbook upload webserver -o . --force

**generate cookbooks**
chef generate cookbook webserver
