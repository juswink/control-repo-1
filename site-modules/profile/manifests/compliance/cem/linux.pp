class profile::compliance::cem::linux {

  class { 'cem_linux':
    benchmark => 'cis',
    config    => {
      'level'           => '1',
      'profile'         => 'server',
    }
  }
}
