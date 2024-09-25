Vagrant.configure("2") do |config|
    config.vm.define "master1" do |master1|
        master1.ssh.insert_key = false
        master1.vm.network :private_network, ip: "192.168.10.10"
        master1.vm.box = "bento/ubuntu-20.04"
        master1.vm.network "forwarded_port", guest: 27017, host: 27017, protocol: "tcp"
        master1.disksize.size = "20GB"
        master1.vm.hostname = "master1"
        master1.vm.boot_timeout = 500
        master1.vm.provision :shell, path: "bootstrap.sh"
        # master1.vm.provision :shell, path: "master.sh"
        master1.vm.provider :virtualbox do |vb|
            vb.gui = false
            vb.customize ["modifyvm", :id, "--memory", "8048"]
            vb.customize ["modifyvm", :id, "--cpus", "4"]
      end
    end
end