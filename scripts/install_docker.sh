sudo yum install -y git yum-utils
sudo yum-config-manager --add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum -y install docker-ce
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
sudo systemctl stop getty@tty1.service
sudo systemctl mask getty@tty1.service
#logout
