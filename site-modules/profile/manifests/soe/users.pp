class profile::soe::users {
  $users = lookup('users')
  $users.each |String $user| {
    if $facts['kernel'] == 'Linux' {
      user { $user:
        ensure => present,
      }  
    }
    if $facts['kernel'] == 'windows' {
      user { $user:
        ensure => present,
        name => $user,
        groups => 'Users'
      }  
    }  
  }
}
