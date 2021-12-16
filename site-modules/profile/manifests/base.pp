class profile::base {

  #the base profile should include component modules that will be on all nodes
  
  class { 'chrony':
    servers => lookup('ntpservers'),
  }
  
  class { 'motd':
    content => lookup('motd'),
  }
}
