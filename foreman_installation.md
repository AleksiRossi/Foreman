## Foreman installation


## Packages
Begin with adding the repository for puppet

	sudo apt-get -y install ca-certificates
	sudo wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
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

### Custom options
Installing Foreman with default settings works fine, but in this case we want to enable DHCP, DNS and TFTP functionality, which are disabled by default.

	* Configure foreman_proxy:
		* Set tftp_servername, current value: 192.168.1.210
		* Set dhcp, current value: true
		* Set dhcp_interface, current value: eth3
		* Set dhcp_gateway, current value: 192.168.1.1
		* Set dhcp_range, current value: 192.168.1.20 192.168.1.70
		* Set dns, current value: true
		* Set dns_interface, current value: eth3
		* Set dns_reverse, current value: 1.168.192.in-addr.arpa
	* Configure foreman_plugin_dhcp_browser: true

After the installation reboot the machine so it will add itself to the Foreman as a host.

Success!
  * Foreman is running at https://foreman.localdomain
  * Foreman Proxy is running at https://foreman.localdomain:8443
  * Puppetmaster is running at port 8140
  The full log is at /var/log/foreman-installer/foreman.log
