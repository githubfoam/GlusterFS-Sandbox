# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "austinbutler/archlinux-cli-x86_64" #archlinux/archlinux
  config.vm.synced_folder ".", "/vagrant", disabled: true


  config.vm.define "gluster1" do |gluster|
    gluster.vm.network "private_network", ip: "192.168.33.11"
  end

  config.vm.define "gluster2" do |gluster|
    gluster.vm.network "private_network", ip: "192.168.33.12"
  end

  config.vm.define "gluster3" do |gluster|
    gluster.vm.network "private_network", ip: "192.168.33.13"
  end

  config.vm.define "client" do |client|
    client.vm.network "private_network", ip: "192.168.33.2"
    client.vm.box = "centos/7"
  end

  config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
  end
end
