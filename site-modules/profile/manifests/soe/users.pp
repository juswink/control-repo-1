class profile::soe::users {
  $users = lookup('users')
  $users.each |String $user| {
    user { $user:
      ensure => present,
    }
  }
}
