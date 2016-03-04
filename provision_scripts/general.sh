if [ -n "$(command -v yum)" ] ; then
    echo "YUM"
    yum -y install vim 
    #screen make automake gcc gcc-c++ kernel-devel
    yum -y update
elif [ -n "$(command -v apt-get)" ] ; then
    echo "APT_GET"
    apt-get update
    apt-get install -y vim
    
    # screen build-essential

    #caused problems with GRUB boot loader
    #apt-get -y upgrade
fi
