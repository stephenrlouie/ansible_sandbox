#If this box is not on your machine, vagrant up base and make that a base box. Then add that to vagrant
$ubuntu_box_name = "hashicorp/precise32"
$centos_box_name = "cent6_minimal"
#Ubuntu: hashicorp/precise32
#CentOS: puphpet/centos65-x64

def small(config)
    config.vm.provider "virtualbox" do |v|
      v.memory = 512 
      v.cpus = 1
    end
end

#username vagrant, pass vagrant
Vagrant.configure(2) do |config|

   config.vm.define "build_master", autostart: false do |build_master|
        small(config)

        build_master.vm.box = $ubuntu_box_name 
        build_master.vm.hostname = "build-master"
        build_master.vm.network "private_network", ip: "192.168.1.2"
        build_master.vm.provision :"shell", path: "provision_scripts/general.sh"
        build_master.vm.provision :"shell", path: "provision_scripts/master.sh", privileged: false
        build_master.vm.provider "virtualbox" do |vb|
            vb.name = "build_master"
        end 
    end
    
    config.vm.define "build_ubuntu_slave", autostart: false do |build_ubuntu_slave|
        small(config)
        
        build_ubuntu_slave.vm.box = $ubuntu_box_name 
        build_ubuntu_slave.vm.hostname = "build-ubuntu-slave"
        build_ubuntu_slave.vm.network "private_network", ip: "192.168.1.3"
        build_ubuntu_slave.vm.provision :"shell", path: "provision_scripts/general.sh"
        build_ubuntu_slave.vm.provision :"shell", path: "provision_scripts/slave.sh"
        build_ubuntu_slave.vm.provider "virtualbox" do |vb|
            vb.name = "build_ubuntu_slave"
        end 
    end

    config.vm.define "build_centos_slave", autostart: false do |build_centos_slave|
        small(config)
        
        build_centos_slave.vm.box = $centos_box_name 
        build_centos_slave.vm.hostname = "build-centos-slave"
        build_centos_slave.vm.network "private_network", ip: "192.168.1.4"
        build_centos_slave.vm.provision :"shell", path: "provision_scripts/general.sh"
        build_centos_slave.vm.provision :"shell", path: "provision_scripts/slave.sh"
        build_centos_slave.vm.provider "virtualbox" do |vb|
            vb.name = "build_centos_slave"
        end 
    end

    config.vm.define "master", autostart: true do |master|
        small(config)

        master.vm.box = "ansible_master"
        master.vm.hostname = "master"
        master.vm.network "private_network", ip: "192.168.1.2"
        master.vm.provider "virtualbox" do |vb|
            vb.name = "ansible_master"
        end 
    end
    
    config.vm.define "ubuntu_slave", autostart: true do |ubuntu_slave|
        small(config)
        
        ubuntu_slave.vm.box = "ansible_ubuntu_slave"
        ubuntu_slave.vm.hostname = "ubuntu-slave"
        ubuntu_slave.vm.network "private_network", ip: "192.168.1.3"
        ubuntu_slave.vm.provider "virtualbox" do |vb|
            vb.name = "ansible_ubuntu_slave"
        end 
    end
    
    config.vm.define "centos_slave", autostart: true do |centos_slave|
        small(config)
        
        centos_slave.vm.box = "ansible_centos_slave"
        centos_slave.vm.hostname = "centos-slave"
        centos_slave.vm.network "private_network", ip: "192.168.1.4"
        centos_slave.vm.provider "virtualbox" do |vb|
            vb.name = "ansible_centos_slave"
        end 
    end


end
