# This has to be coded, I am now writing the steps and will code later
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum -y install docker-ce
systemctl start docker
systemctl enable docker
docker run hello-world

