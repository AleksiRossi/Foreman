class ufw {
        package { 'ufw':
                ensure => installed,
        }
        service { 'ufw':
                require => Package['ufw'],
                ensure => running,
                enable => true,
        }
        exec { 'ufw-deny':
                require => Package['ufw'],
                path => [ '/bin', '/usr/bin', '/usr/sbin' ],
                command => 'ufw default deny',
                unless => 'sudo ufw status verbose | grep "Default: deny (incoming), allow (outgoing)"',
        }
        exec { 'ufw-enable':
                require => Package['ufw'],
                path => [ '/bin', '/usr/bin', '/usr/sbin' ],
                command => 'yes | ufw enable',
                unless => 'ufw status | grep "Status: active"',
        }
        exec { 'ufw-ssh':
                require => Package['ufw'],
                path => [ '/bin', '/usr/bin', '/usr/sbin' ],
                command => 'ufw allow 22',
                unless => 'ufw status | grep "22 * ALLOW"',
        }
}
