class profile::base {

  #the base profile should include component modules that will be on all nodes
  
  $packages_to_be_installed = lookup('packages_to_be_installed')
  
  $packages_to_be_installed.each | String $package | {
    package { $(package):
      ensure  => installed,
    }
  }
}
