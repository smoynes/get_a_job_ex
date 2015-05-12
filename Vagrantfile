require 'time'

VAGRANTFILE_API_VERSION = "2"

def local_timezone()
  offset = Time.now.gmt_offset / 60 / 60
  return "Etc/GMT#{sprintf('%+d', -offset)}"
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :get_a_job_ex_dev
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, ip: "192.168.10.100"
  config.vm.provision "shell",
                      path: File.join('scripts', 'bootstrap.sh'),
                      args: [local_timezone]
  config.vm.network :forwarded_port, host: 4000, guest: 4000
end
