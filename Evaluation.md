# Foreman evaluation

Foreman is a front and a user interface for Puppet configuration management system. Along with controlling and managing Puppet, Foreman includes some added features, such as provisioning hosts and monitoring status of hosts. 

## What did we learn

For being open source software, Foreman feels like a very finished product. The installation is streamlined and simple and the software is rather simple and easy to use out of the box, with support to all the major Linux distributions.

The installations happens via specially constructed puppet module or "installation pack". You just need to add the package to your repository and download it. Afterwards you can simply start the installer via "foreman-installer" command and it installs a default configuration. The installer also includes an interactive mode to configure Foreman to your liking and even includes methods to automate the whole process via answer.yaml file. In our setup, we needed to active some extra features (dhcp, dns and tftp proxies) to get the provisioning working properly. 

After the installation you can simply login to your web user interface and setup networks, operating systems and hosts to your liking and start provisioning. Foreman includes several default templates that are used for provisioning. We, for example, used default Preseed templates at first and the provisioning went fine. 

Along with provisioning, you can import puppet modules to Foreman and apply them to selected added hosts. Foreman then reports on their status. This provides the mechanics for complete server life cycle management. 

## How did it perform

While Foreman is a very finished product for an open source software, it is still has some defining traits of open source. When you deviate from the out of the box experience documentation starts becoming lacking and you have to figure out what you want to do on your own. 

Some problems we encountered early on included Foreman requiring a spesific hostname and provisioning needing proxies to be setup. The Foreman manual provided help with these but didn't exactly point you to the right direction. After you understand the logic behind the software, it wasn't too hard to figure out what needed to be done however. 

Biggest issues we had were with partioning a new host during provisioning. At first we used the default Preseed partioning table and it worked fine on our test machines. After we tried to apply it our school's computers, however, we ran into several problems, starting from the host not finding the template to invalid root partition. Most of the problems were a result of the computer being setup for UEFI instead of normal BIOS settings. We created several partition tables of our own but in the end still didn't manage to automate the provisioning process succesfully for computers using UEFI. 

## What is it for

We believe Foreman can be very helpful piece of software, especially in enterprise environment. Even though Puppet alone is somewhat hard to get into the Foreman makes the whole process much more accessible. You still need someone who understand the Puppet language and sets everything up, but after that nearly everyone can manage the modules and whole systems with ease. 

As user experience becomes more important factor in all of ICT, Foreman manages to make Puppet a lot more easier to use and allows you to generate helpful reports to people who have never looked at command lines. You also get easy to access web interface that tells exactly what is going on with your hosts and even can alert you when something goes wrong. This isn't a monitoring system but nobody is against having extra information about your infrastructure.
