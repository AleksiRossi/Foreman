## Foreman installation


## Packages
Begin with adding the repository for puppet

	apt-get -y install ca-certificates
	wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
	dpkg -i puppetlabs-release-trusty.deb

And enabling it. Requires root. 

	sudo -i

	echo "deb http://deb.theforeman.org/ trusty 1.11" > /etc/apt/sources.list.d/foreman.list
	echo "deb http://deb.theforeman.org/ plugins 1.11" >> /etc/apt/sources.list.d/foreman.list
	wget -q http://deb.theforeman.org/pubkey.gpg -O- | apt-key add -

## Installation

Set hostname and edit /etc/hosts to match

	hostnamectl set-hostname foreman.localdomain

	vim /etc/hosts
	192.168.1.210   foreman.localdomain foreman
	
Download the installer
	
	apt-get update && apt-get -y install foreman-installer

Start the installation
	
	sudo foreman-installer -i

-i is for interactive mode
	

Success!
  * Foreman is running at https://foreman.localdomain
  * Foreman Proxy is running at https://foreman.localdomain:8443
  * Puppetmaster is running at port 8140
  The full log is at /var/log/foreman-installer/foreman.log
