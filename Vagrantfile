# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.ssh.forward_agent = true
  config.ssh.private_key_path = "deploy/keys/vagrant"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.define "dev", primary: true do |dev|
    dev.vm.network :private_network, ip: "192.168.50.10"
    dev.vm.network "forwarded_port", guest: 80, host: 8080
    dev.vm.network "forwarded_port", guest: 8000, host: 8000
    dev.vm.network "forwarded_port", guest: 9000, host: 9000
  end
end
