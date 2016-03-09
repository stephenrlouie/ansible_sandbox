ssh-keygen -f ansible.rsa -t rsa -N ''
sudo cp ansible.rsa.pub /vagrant

#Installs ansible
if [ -n "$(command -v yum)" ] ; then
    yum install -y ansible
elif [ -n "$(command -v apt-get)" ] ; then
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible   
    sudo apt-get update -y
    sudo apt-get install -y ansible
fi
