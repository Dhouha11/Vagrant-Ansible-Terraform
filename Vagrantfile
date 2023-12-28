Vagrant.configure("2") do |config|
    config.vm.box = "generic/ubuntu2204"
    config.vm.network "private_network", type: "dhcp"
    config.vm.synced_folder ".", "/vagrant_data", disabled: true
  
    # Define the number of virtual machines you want
    num_vm = 2
  
    # Loop to create virtual machines
    (1..num_vm).each do |i|
      config.vm.define "vm#{i}" do |vm|
        vm.vm.box = "generic/ubuntu2204"
        config.vm.network "forwarded_port", guest: 80, host: 808{i}, id: "mycv_vm#{i}"
        vm.vm.hostname = "dhouha#{i}"
    
        vm.vm.provider "virtualbox" do |vb|
          vb.name = "dhouha#{i}"
          vb.memory = 2048
          vb.cpus = 2
        end
  
        vm.vm.provision "ansible" do |a|
          a.verbose = "v"
          a.playbook = "playbook.yaml"
        end
      end
    end
  end
  
