Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.network :private_network, ip: '192.168.33.10'

  config.vm.provider "virtualbox" do |vb|

      vb.name = "WebServer"
      vb.cpus = 1
      vb.memory = 1024
      vb.gui = false

  end

  config.vm.provision "shell", path: "vagrant_files/install.sh"
end
