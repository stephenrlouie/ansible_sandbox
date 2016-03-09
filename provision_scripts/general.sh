if [ -n "$(command -v yum)" ] ; then
    echo "YUM"
    yum -y install vim 
    yum -y update
elif [ -n "$(command -v apt-get)" ] ; then
    echo "APT_GET"
    apt-get update
    apt-get install -y vim
fi
