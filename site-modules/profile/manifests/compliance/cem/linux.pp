class profile::compliance::cem::linux {

  include cem_linux

  class { 'cem_linux':
    benchmark => 'cis',
    config    => {
      'level'   => '1',
      'profile' => 'server',
    }
  }
}
