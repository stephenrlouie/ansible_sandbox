Vagrant Ansible Sandbox 
============
1 build node, 1 slave node
------------
**Steps**
- Create "build" images
- Package "build" images
- Add images to vagrant
- Do Ansible
Setup
-----------

- Create the master image. (It creates the ssh_key and installs ansible)
    ```
    vagrant up build_master
    ```
- Create a node we will deploy things to. (It puts the ssh key in the authorized keys file)
    ```
    vagrant up build_slave
    ```
- Package up the current image
    ```
    vagrant package build_master --output <path_to_store>/ansible_master.box
    vagrant package build_slave --output <path_to_store>/ansible_slave.box
    ```
- Add to vagrant's box list
    ```
    vagrant box add ansible_master /path/to/ansible_master.box
    vagrant box add ansible_slave /path/to/ansible_slave.box
    ```
- Destroys the build boxes
    ```
    vagrant destroy build_master build_slave -f
    ```
- Will deploy from the pre-made images, much faster than before for any future tests
    ```
    vagrant up
    ```
Doing Ansible
------------
1.Log into the master node
    ```
    vagrant ssh master
    ```
2.Create an inventory file, a file just with the slave IP: 192.168.1.3
    ```
    ansible all -m ping -i <inventory_file> --private-key <path_to_ansible.rsa>
    ```

- **To destory slave node and start with a fresh slave node**
    ```
    vagrant destroy slave
    vagrant up slave
    ```