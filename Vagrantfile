VAGRANTFILE_API_VERSION = "2"

require 'time'
timezone = Time.now.zone

$script = <<SCRIPT
set -e

hostname wakesiah-dev

echo "#{timezone}" | tee /etc/timezone && \
  dpkg-reconfigure --frontend noninteractive tzdata

echo "Installing erlang vendor repo"
apt-add-repository -y \
  "deb http://packages.erlang-solutions.com/ubuntu trusty contrib" > /dev/null
curl -s https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | \
  apt-key add - > /dev/null
apt-get -qq update

echo "Upgrading packages"
apt-get -qq upgrade

echo "Installing build tools"
apt-get -qq install build-essential curl git-core pkg-config zip

echo "Installing erlang"
apt-get -qq install esl-erlang erlang-manpages elixir

echo "Installing postgres"
apt-get -qq install postgresql-9.3 postgresql-client-9.3
sudo -u postgres psql -c \
  "CREATE ROLE get_a_job WITH CREATEROLE CREATEDB LOGIN PASSWORD 'password';"

### TODO: set PGUSER and PGHOSTNAME env vars

echo "Provisioning completed: ok"
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :get_a_job_ex_dev
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, ip: "192.168.10.100"
  config.vm.provision "shell", inline: $script
end
