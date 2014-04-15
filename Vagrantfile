# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

# DEFAULT SETTINGS ######################################################################
# Override by setting them in your ~/.vagrant.d/Vagrantfile
# e.g.
# $bridge_if = 'Broadcom NetXtreme Gigabit Ethernet Controller'
$bridge_if ||= 'en1: USB Ethernet'
$ncpus ||= '2'
$memsize ||= '512'

# ENVIRONMENT VARIABLES #################################################################
# PUPPET_ARGS: extra args to pass to puppet on the command line.
# e.g.
# PUPPET_ARGS="--debug" vagrant provision

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
# BOX CONFIG ############################################################################
  config.vm.box = "CentOS-6.5-x86_64-puppet"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"

# VM CONFIG #############################################################################
  config.vm.network :public_network, :bridge => $bridge_if
  config.vm.synced_folder "templates/", "/var/lib/puppet/templates"

  config.vm.provider :parallels do |parallels|
    parallels.customize ["set", :id, "--memsize", $memsize]
    parallels.customize ["set", :id, "--cpus", $ncpus]
    parallels.customize ["set", :id, "--on-window-close", "keep-running"]
  end

  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--memory", $memsize]
    virtualbox.customize ["modifyvm", :id, "--cpus", $ncpus]
  end

# PUPPET CONFIG #########################################################################
  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "init.pp"
    puppet.module_path = ["modules"]
    puppet.options = "--parser=future --verbose " + ENV['PUPPET_ARGS'].to_s
  end

  config.vm.provision :shell,
    inline: 'echo "--================================--
Kibana running on http://`facter ipaddress`/
Redis accepting logstash logs on `facter ipaddress`:6379

Happy logging!"'

end
