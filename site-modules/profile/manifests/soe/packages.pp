class profile::soe::packages {
  
  $facts['kernel'] == 'windows' {
      include chocolatey
  }
  $packages = lookup('packages')
  $packages.each |String $package| {    
    package { $package:
      ensure => latest,
    }
  }
}
