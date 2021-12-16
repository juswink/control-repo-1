class profile::base {

  #the base profile should include component modules that will be on all nodes
  
  include motd
  include chrony
  
  class { 'chrony':
    servers => lookup('ntpservers'),
  }
}
