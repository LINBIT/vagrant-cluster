# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "alpha" do |alpha|
	  alpha.vm.hostname = "alpha"
	  alpha.vm.network "private_network", ip: "192.168.70.11"
  end
  config.vm.define "bravo" do |bravo|
	  bravo.vm.hostname = "bravo"
	  bravo.vm.network "private_network", ip: "192.168.70.12"
  end
  config.vm.define "charlie" do |charlie|
	  charlie.vm.hostname = "charlie"
	  charlie.vm.network "private_network", ip: "192.168.70.13"
  end
  config.vm.define "delta" do |delta|
	  delta.vm.hostname = "delta"
	  delta.vm.network "private_network", ip: "192.168.70.14"
  end

  config.vm.provision "shell", inline: <<-SHELL
  		echo "192.168.70.11 alpha" >> /etc/hosts
  		echo "192.168.70.12 bravo" >> /etc/hosts
  		echo "192.168.70.13 charlie" >> /etc/hosts
  		echo "192.168.70.14 delta" >> /etc/hosts

		apt-get update
		apt-get install -y git automake flex python-setuptools python-dbus python-gobject lvm2

		cp -r /vagrant/upstream /tmp

		cd /tmp/upstream/drbd-9.0
		make && make install
		modprobe drbd
		echo "drbd" >> /etc/modules

		cd /tmp/upstream/drbd-utils
		./autogen.sh
		./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --without-83support --without-84support
		make
		touch documentation/v9/drbd.conf.5
		touch documentation/v9/drbd.8
		touch documentation/v9/drbdadm.8
		touch documentation/v9/drbdsetup.8
		touch documentation/v9/drbdmeta.8
		touch documentation/v9/drbd-overview.8
		make install

		cd /tmp/upstream/drbdmanage
		./setup.py install
  SHELL

end
