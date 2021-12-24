class profile::soe::users {
  $users = lookup('users')
  $users.each |String $user| {
    if $facts['kernel'] == 'Linux' {
      user { $user:
        ensure => present,
        password => 'nixuser',
      }  
    }
    if $facts['kernel'] == 'windows' {
      user { $user:
        ensure => present,
        name => $user,
        groups => [ 'Users', 'Remote Desktop Users' ],
        password => 'P@ssw0rd',
      }  
    }  
  }
}
