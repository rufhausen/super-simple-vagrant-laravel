# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise32"
  config.vm.hostname = "test-local"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provider :virtualbox do |vb|
          vb.customize [ "modifyvm", :id, "--memory", 1024]
  end
  #apache/mysql
  config.vm.network :forwarded_port, host: 9013, guest: 80
  config.vm.network :forwarded_port, host: 3307, guest: 3306
  #file permissions
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=666"]

end