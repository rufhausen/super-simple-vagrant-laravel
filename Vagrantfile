# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise32"
  config.vm.hostname = "devbox"
  config.vm.network "private_network", ip: "192.168.50.1"
  config.vm.provision :shell, :path => "bootstrap.sh"
  #apache
  config.vm.network :forwarded_port, host: 9011, guest: 443
  #mysql
  config.vm.network :forwarded_port, host: 3307, guest: 3306
  #file permissions
  config.vm.synced_folder ".", "/vagrant", :extra => "dmode=777,fmode=666"

end
