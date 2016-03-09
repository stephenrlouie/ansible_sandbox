#Vagrant Ansible Sandbox in Virtualbox

- 1 build node, 1 slave node

##**Steps**
1. Create "build" images
2. Package "build" images
3. Add images to vagrant
4. Do Ansible

##Setup

- Pull down the cent6 image

    `./get_cent6_minimal.sh`

- Create the master image. (It creates the ssh_key and installs ansible) and slave nodes (deploys ssh key)

    ```
    vagrant up build_master
    vagrant up build_ubuntu_slave
    vagrant up build_centos_slave
    ```

- Package up the current image

    ```
    vagrant package build_master --output <storage_path>/ansible_master.box
    vagrant package build_ubuntu_slave --output <storage_path>/ansible_ubuntu_slave.box
    vagrant package build_centos_slave --output <storage_path>/ansible_centos_slave.box
    ```
    
- Add to vagrant's box list
    
    ```
    vagrant box add ansible_master <storage_path>/ansible_master.box
    vagrant box add ansible_ubuntu_slave <storage_path>/ansible_ubuntu_slave.box
    vagrant box add ansible_centos_slave <storage_path>/ansible_centos_slave.box
    ```
    
- Destroys the build boxes
    
    `vagrant destroy build_master build_ubuntu_slave build_centos_slave -f`

- Will deploy from the pre-made images, much faster than before for any future tests
    
    `vagrant up`

##Doing Ansible

1. Log into the master node
    
    `vagrant ssh master`
    
2. Create an inventory file, a file just with the slave IP: 192.168.1.3
    
    `ansible all -m ping -i <inventory_file> --private-key <storage_path>/ansible.rsa`
    
- **To destory slave node and start with a fresh slave node**
    
    ```
    vagrant destroy ubuntu_slave centos_slave
    vagrant up ubuntu_slave centos_slave
    ```
