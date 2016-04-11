## Foreman installation


## Packages
Begin with adding the repository for puppet

	sudo apt-get -y install ca-certificates
	wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
	sudo dpkg -i puppetlabs-release-trusty.deb

And enabling it. Requires root. 

	sudo -i

	echo "deb http://deb.theforeman.org/ trusty 1.11" > /etc/apt/sources.list.d/foreman.list
	echo "deb http://deb.theforeman.org/ plugins 1.11" >> /etc/apt/sources.list.d/foreman.list
	wget -q http://deb.theforeman.org/pubkey.gpg -O- | apt-key add -
	exit

## Installation

Set hostname and edit /etc/hosts to match

	sudo hostnamectl set-hostname foreman.localdomain

	sudo nano /etc/hosts
	192.168.1.210   foreman.localdomain foreman
	
Download the installer
	
	sudo apt-get update && sudo apt-get -y install foreman-installer

Start the installation
	
	sudo foreman-installer -i

-i is for interactive mode
	

Success!
  * Foreman is running at https://foreman.localdomain
  * Foreman Proxy is running at https://foreman.localdomain:8443
  * Puppetmaster is running at port 8140
  The full log is at /var/log/foreman-installer/foreman.log
