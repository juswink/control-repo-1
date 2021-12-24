class profile::soe::packages {
  
  if $facts['kernel'] == 'windows' {
      include chocolatey
  }
  $packages = lookup('packages')
  $packages.each |String $package| { 
    case $facts['kernel'] {
      'Linux': {
        package { $package:
          ensure => latest,
        }
      }
      'windows': {
        package { $package:
          ensure => latest,
          provider => 'chocolatey',
          install_options => ['-y']
        }
      }
    }
  }
}
