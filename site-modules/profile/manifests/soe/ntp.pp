class profile::soe::ntp {

  case $facts['kernel'] {
    'Linux': {
    #  case $facts['operatingsystem']['operatingsystemmajrelease'] {
    #    'CentOS', '8':  { 
          class { 'chrony':
            servers => lookup('ntpservers'),
          }
    #    }
    #    'CentOS', '7':  { 
    #      class { 'ntp':
    #         servers => lookup('ntpservers'),
    #      }
    #    }
    #  }
    }
    'windows':  { 
        class { 'winntp':
          servers => lookup('ntpservers'),
        }
    }

    default:  { fail ( "Too bad, so sad!\n" ) }
  }

}
