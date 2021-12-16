class profile::base {

  #the base profile should include component modules that will be on all nodes
  
  if ( $facts['kernel'] == 'Linux' ) {
    if ( $facts['operatingsystemmajrelease'] == '8' ) {
      class { 'chrony':
        servers => lookup('ntpservers'),
      }
    }
    if ( $facts['operatingsystemmajrelease'] == '7' ) {
      class { 'ntp':
        servers => lookup('ntpservers'),
      }
    }
  }
  
  if ( $facts['kernel'] == 'Windows' ) {
    class { 'winntp':
        servers => lookup('ntpservers'),
    }
  }
  
  class { 'motd':
    content => lookup('motd'),
  }
}
