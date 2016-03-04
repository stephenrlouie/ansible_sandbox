#If this box is not on your machine, vagrant up base and make that a base box. Then add that to vagrant
$box_name = "hashicorp/precise32"
#Ubuntu: hashicorp/precise32

def small(config)
    config.vm.provider "virtualbox" do |v|
      v.memory = 512 
      v.cpus = 1
    end
end

#username vagrant, pass vagrant
Vagrant.configure(2) do |config|

    config.ssh.username = "vagrant"
    config.ssh.password = "ssh"
    

   config.vm.define "build_master", autostart: false do |build_master|
        small(config)

        build_master.vm.box = $box_name 
        build_master.vm.hostname = "build-master"
        build_master.vm.network "private_network", ip: "192.168.1.2"
        build_master.vm.provision :"shell", path: "provision_scripts/general.sh"
        build_master.vm.provision :"shell", path: "provision_scripts/master.sh", privileged: false
        build_master.vm.provider "virtualbox" do |vb|
            vb.name = "build_master"
        end 
    end
    
    config.vm.define "build_slave", autostart: false do |build_slave|
        small(config)
        
        build_slave.vm.box = $box_name 
        build_slave.vm.hostname = "build-slave"
        build_slave.vm.network "private_network", ip: "192.168.1.3"
        build_slave.vm.provision :"shell", path: "provision_scripts/general.sh"
        build_slave.vm.provision :"shell", path: "provision_scripts/slave.sh"
        build_slave.vm.provider "virtualbox" do |vb|
            vb.name = "build_slave"
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
    
    config.vm.define "slave", autostart: true do |slave|
        small(config)
        
        slave.vm.box = "ansible_slave"
        slave.vm.hostname = "slave"
        slave.vm.network "private_network", ip: "192.168.1.3"
        slave.vm.provider "virtualbox" do |vb|
            vb.name = "ansible_slave"
        end 
    end
    


end
