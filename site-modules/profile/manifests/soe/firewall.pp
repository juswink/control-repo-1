class profile::soe::firewall {

  firewall { '000 accept all icmp requests':
    proto  => 'icmp',
    action => 'accept',
  }

  case $facts['kernel'] {
    'Linux':  {
        firewall { '010 Allow inbound SSH':
          dport  => 22,
          proto  => 'tcp',
          action => 'accept',
        }
        #firewall { '020 Allow inbound HTTP':
        #  dport    => 80,
        #  proto    => 'tcp',
        #  action   => 'accept',
        #}
    }
    'windows':  {
        class { 'windows_firewall':
          ensure => 'running',
        }

        windows_firewall::exception { 'WINRM':
          ensure       => present,
          direction    => 'in',
          action       => 'allow',
          enabled      => true,
          protocol     => 'TCP',
          local_port   => 5985,
          remote_port  => 'any',
          display_name => 'Windows Remote Management HTTP-In',
          description  => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5985]',
        }

        windows_firewall::exception { 'RDP':
          ensure       => present,
          direction    => 'in',
          action       => 'allow',
          enabled      => true,
          protocol     => 'TCP',
          local_port   => 3389,
          remote_port  => 'any',
          display_name => 'Remote Desktop Protocol-In',
          description  => 'Inbound rule for Remote Desktop Protocol. [TCP 3389]',
        }

        #windows_firewall::exception { 'HTTP':
        #  ensure       => present,
        #  direction    => 'in',
        #  action       => 'allow',
        #  enabled      => true,
        #  protocol     => 'TCP',
        #  local_port   => 80,
        #  remote_port  => 'any',
        #  display_name => 'HTTP-In',
        #  description  => 'Inbound rule for HTTP. [TCP 80]',
        #}
    }
    default: { notify { "Too bad, so sad!\n": } }
  }

}
