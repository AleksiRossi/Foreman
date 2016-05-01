# Adding puppet modules to Foreman
You can create own puppet modules for Foreman or you can download them from puppetlabs.
The modules can then be included in a host installation.

## Creating a puppet module
By default modules should be placed in /etc/puppet/environments/production/modules so they
can be easily imported via Foreman interface.

Example for a puppet module that installs git:

/etc/puppet/environments/production/modules/git/manifests/init.pp
```
class git {
  package { 'git':
    ensure => 'installed',
  }
}
```

Modules can be downloaded from puppetlabs with command
```
sudo puppet module install -i
```
For example, we downloaded NTP module:
```
sudo puppet module install -i /etc/puppet/environments/production/modules puppetlabs/ntp
```

## Importing puppet modules to Foreman
The modules need to be imported to the Foreman before they can be distributed to hosts.

In the Foreman interface go to Configure -> Classes and click Import.
After the modules have been imported they can be included in a host installation from Puppet Classes tab
when creating a new host. 
