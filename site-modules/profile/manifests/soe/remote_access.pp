class profile::soe::remote_access {
   case $facts['kernel'] {
    # 'Linux': {
       #ssh::sshd_config_allowusers {}
     #}
     'windows': {
       dsc_userrightsassignment {'Allow log on through Remote Desktop Services':
         dsc_force       => true,
         dsc_policy      => 'Allow log on through Remote Desktop Services',
         dsc_identity    => ['BUILTIN\\Users'],
         validation_mode => 'resource',
       }
     }
   }
}
