class profile::compliance::cem::windows {

  class { 'cem_windows':
    benchmark => 'cis',
    config    => {
      'level'           => '1',
      'profile'         => 'server',
    }
  }
}
