#Server lifecycle management with Foreman

This project is part of Linux project course in Haaga-Helia. In this project we create a server environment and manage it with Foreman. Members of this project group are Aleksi Rossi and Teemu Partanen

##What is Foreman

Foreman is an open source server management tool for linux systems. It provides operating system provisioning, configuration management and monitoring for both physical and virtual machines.

Provisioning on bare metal is provided via DHCP, DNS, TFTP and PXE as long as the machine is set for network boot. The host machine is turned on, sends a broadcast signal to Foreman, which replies with an IP address, host contacts PXE server, which replies with an OS image stored in it’s TFTP server. This will start an unattended OS installation.

After the server has been installed, it will be configured by Puppet, which can be managed through Foreman’s user interface. Puppet will also gather information about the server, like memory usage and server time, which can be reported to Foreman. This will allow Foreman to  function as a monitoring tool for your hosts and provide an easy to manage source of configuration information.

In conclusion, Foreman can be used to streamline server deployment, simplify configuration management and manage the server through it’s whole life cycle.

##Purpose of the project

Our goal for the project is install and evaluate Foreman. We are going to install Foreman and Puppet, configure Foreman for the provisioning process, create some Puppet modules for testing and see if we can deploy a few servers. In the presentation, we will discuss the installation and deployment process, possible problems and our opinion of the software. 

Other things to consider if we have time:
* API features and automation
* Plugins

##Timetable

w13 Come up with a project plan

w14 Create and configure a server for Foreman and Puppet, if they need separate servers

w15 Successfully install OS to a host via PXE using Foreman

w16 Successfully configure a host via Puppet and report results to Foreman

w17 Completely install, configure and monitor a host with Foreman

w18 Presentate the project

w19 Presentate the project (if 2nd day is needed)

##Development environment

CloudPlatform, is there any other choice?

##Risks involved in this project


If the project is made in Citrix CloudPlatform the biggest risk lies in there. The CloudPlatform is known for its unreliability, and it may not work all the time. One member of the project is working part time and the other one has too many other courses this spring so time is another risk.


