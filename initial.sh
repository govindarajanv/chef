useradd admin
passwd admin
usermod -g wheel admin
groups admin
visudo   
	## Allows people in group wheel to run all commands
	#%wheel ALL=(ALL)       ALL		##comment this out
	## Same thing without a password
	%wheel  ALL=(ALL)       NOPASSWD: ALL  ##uncomment this portion
