class profile::soe::packages {
  
  if $facts['kernel'] == 'windows' {
      include chocolatey
  }
  $packages = lookup('packages')
  $packages.each |String $package| {    
    package { $package:
      ensure => latest,
    }
  }
}
