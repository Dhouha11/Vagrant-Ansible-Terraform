# Install VirtualBox, Ansible and Python3-pip
sudo apt install virtualbox ansible python3-pip

#Install gnup software-properties-common and curl 
sudo apt-get install -y gnupg software-properties-common curl

# Vagrant repo adding and install
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install Vagrant version=2.3.4 on Ubuntu 22.04.3 LTS to prevent the compatibility problem with ansible
sudo apt update && sudo apt install vagrant=2.3.4
sudo apt-mark hold vagrant=2.3.4
#Nested Virtualization
set-VMProcessor -VMName Ubuntu-Vagrant -ExposeVirtualizationExtensions $true
