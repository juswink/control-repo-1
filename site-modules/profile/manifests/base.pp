class profile::base {

  #the base profile should include component modules that will be on all nodes
  
  include motd
  
  class { 'chrony':
    servers => lookup('ntpservers'),
  }
  
  class { 'motd':
    content => lookup('motd'),
  }
}
