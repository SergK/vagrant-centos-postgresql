# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos64-x86_64-20140806"
  
  config.vm.network "forwarded_port", guest: 5432, host: 5432, protocol: 'tcp'
  config.vm.network "forwarded_port", guest: 5432, host: 5432, protocol: 'udp'

  config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
  end

  config.vm.provision :shell, path: "setup/bootstrap.sh"

end
