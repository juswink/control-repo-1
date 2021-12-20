class profile::soe::packages {
  $packages = lookup('packages')
  $packages.each |String $package| {
    package { $package:
      ensure => latest,
    }
  }
}
