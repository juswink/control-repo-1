class profile::base {

  #the base profile should include component modules that will be on all nodes
  
  include profile::soe::firewall
  include profile::soe::motd
  include profile::soe::ntp
  include profile::soe::remote_access
  #include profile::soe::packages
  include profile::soe::users
  
}
