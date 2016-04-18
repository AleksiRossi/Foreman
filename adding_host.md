# Adding new host
After installing Foreman you can use it for installing new hosts via PXE.
First go to the Foreman dashboard.

## Create subnet

1. Intrastructure -> Subnets
2. New Subnet
3. Subnet:
    * Name: test
    * Network address: 192.168.1.0
    * Network mask: 255.255.255.0
    * IPAM: DHCP
    * Start of IP range: 192.168.1.20
    * End of IP range: 192.168.1.70
    * Boot mode: DHCP
4. Domains:
    * localdomain
5. Proxies:
    * DHCP Proxy: foreman.localdomain
    * TFTP Proxy: foreman.localdomain
    * Reverse DNS Proxy: foreman.localdomain
	
## Set DNS Proxy to domain

1. Infrastructure -> Domains
2. localdomain
  * DNS Proxy: foreman.localdomain
	
## Create new operating system

1. Hosts -> Operating systems
2. New Operating system
3. Operating System:
    * Name: testubuntu
    * Major version: 14
    * Minor version: 04
    * Family: Debian
    * Release name: trusty
    * Root password hash: SHA256
    * Architectures: x86_64
4. Submit and go Hosts -> Provisioning templates
	1. Preseed default -> Association:
	  * testubuntu 14.04
	2. Repeat step 1 for Preseed default finish
	3. Repeat step 1 for Preseed default PXELinux
5. Go back to Hosts -> Operating systems -> testubuntu 14.04
6. Partition table:
    * Preseed default
7. Installation media:
    * Ubuntu mirror
8. Templates:
    * provision: Preseed default
    * PXELinux: Preseed default PXELinux
    * finish: Preseed default finish
	
## Create new host

1. Hosts -> New Host
2. Host:
    * Name: testcomp
2. Interface:
    * MAC address: <MAC address of the target computer>
    * DNS name: testcomp
    * Domain: localdomain
    * Subnet: test
    * IP address: 'Suggest new' should offer an IP 192.168.1.20 - 192.168.1.70
    * Managed: true
    * Primary: true
    * Provision: true
3. Operating System:
    * Architecture: x84_64
    * Operating system: testubuntu 14.04
    * Media: Ubuntu mirror
    * Partition table: Preseed default
	
Now connect the test machine to same network as the Foreman and boot it in PXE mode.
It should get IP from Foreman's DHCP and begin installing Ubuntu.
