class  profiles::apache
(
$docroot         = '/var/www',
$port            = '9090',
$docroot_owner   = 'root',
$docroot_group   = 'root',
$servername      = 'akshaypathade1.mylabserver.com',
$vhost_name      = 'website',
$filename        = 'index1.html',
)


{

  class{'apache':
 default_vhost => false,
  }

    file{ ["${docroot}/first","${docroot}/second"] :
        ensure => directory,
        }

 file{'/var/www/first/index.html':
        ensure     => present,
        source => "puppet:///modules/profiles/index1.html",
     }

    file{'/var/www/second/index.html':
    ensure           => present,
    source => "puppet:///modules/profiles/index2.html",

      }

     

          ::apache::vhost{'website_1':
            port          => $port,
            servername    => $servername,
            docroot       => '/var/www/first',
            docroot_owner => $docroot_owner,
            docroot_group => $docroot_group,
              }



         ::apache::vhost{'website_2':
          port          => 9091,
          servername    => $servername,
          docroot       =>   '/var/www/second',
          docroot_owner => $docroot_owner,
          docroot_group => $docroot_group,
            }




         
        }






