if [ -n "$(command -v yum)" ] ; then
    echo "YUM"
    yum -y install vim 
    #screen make automake gcc gcc-c++ kernel-devel
    yum -y update
elif [ -n "$(command -v apt-get)" ] ; then
    
    #Creates the ssh key for vagrant user
    ssh-keygen -f ansible.rsa -t rsa -N ''
    sudo cp ansible.rsa.pub /vagrant
    
    #Installs ansible
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible   
    sudo apt-get update -y
    sudo apt-get install -y ansible
fi
