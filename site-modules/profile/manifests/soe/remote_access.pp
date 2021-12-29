class profile::soe::remote_access {
   #case $facts['kernel'] {
    # 'Linux': {
       #ssh::sshd_config_allowusers {}
     #}
     '#windows': {
     #}
   #}
}
