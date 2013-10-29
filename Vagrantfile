# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise32"
  config.vm.hostname = "videocast-local"
  config.vm.network "private_network", ip: "192.168.50.3"
  config.vm.provision :shell, :path => "bootstrap.sh"
  #apache
  config.vm.network :forwarded_port, host: 9012, guest: 80
  #file permissions
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=666"]

end
