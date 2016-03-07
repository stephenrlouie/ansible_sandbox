#Vagrant Ansible Sandbox 

- 1 build node, 1 slave node

##**Steps**
1. Create "build" images
2. Package "build" images
3. Add images to vagrant
4. Do Ansible

##Setup

- Create the master image. (It creates the ssh_key and installs ansible)

    `vagrant up build_master`
    
- Create a node we will deploy things to. (It puts the ssh key in the authorized keys file)
  
    `vagrant up build_slave`

- Package up the current image

    ```
    vagrant package build_master --output <storage_path>/ansible_master.box
    vagrant package build_slave --output <storage_path>/ansible_slave.box
    ```
    
- Add to vagrant's box list
    
    ```
    vagrant box add ansible_master <storage_path>/ansible_master.box
    vagrant box add ansible_slave <storage_path>/ansible_slave.box
    ```
    
- Destroys the build boxes
    
    `vagrant destroy build_master build_slave -f`

- Will deploy from the pre-made images, much faster than before for any future tests
    
    `vagrant up`

##Doing Ansible

1. Log into the master node
    
    `vagrant ssh master`
    
2. Create an inventory file, a file just with the slave IP: 192.168.1.3
    
    `ansible all -m ping -i <inventory_file> --private-key <storage_path>/ansible.rsa`
    
- **To destory slave node and start with a fresh slave node**
    
    ```
    vagrant destroy slave
    vagrant up slave
    ```
