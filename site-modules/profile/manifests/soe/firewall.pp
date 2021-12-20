class profile::soe::firewall {

  firewall { '000 accept all icmp requests':
    proto  => 'icmp',
    action => 'accept',
  }
  
  case $facts['kernel'] {
    'Linux':  {
        firewall { '010 Allow inbound SSH':
          dport    => 22,
          proto    => 'tcp',
          action   => 'accept',
        }       
    }
    'windows':  {
        firewall { '020 Allow inbound RDP':
          dport    => 3389,
          proto    => 'tcp',
          action   => 'accept',
        }       
    }
    default: { notify { "Too bad, so sad!\n" } }
  }  
}
