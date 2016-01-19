# == Class: phar
#
# Full description of class phar here.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# === Examples
#
#	include phar
#
#	phar::package {'phpunit':
#		phar_location => 'https://phar.phpunit.de',
#		}
#
#	phar::package {'phpdox':
#		phar_location => 'http://phpdox.de',
#		}
#
#	phar::package {'composer':
#		phar_location => 'https://getcomposer.org',
#		auto_update => true,
#		}
#
# Hiera Usage
#
# phar_package:
#   'phpunit':
#        phar_location: 'https://phar.phpunit.de'
#   'composer':
#        phar_location: 'https://getcomposer.org'
#	 auto_update: true
#
#
# === Authors
#
# Author Name <catalin.gf@gmail.com>
#
class phar {
  $myPhar = hiera_hash('phar_package', {})
  if $myPhar {
    create_resources('phar::package', $myPhar)
    }
  }

define phar::package (
  $phar_package = $title,
  $version	= "",
  $target_dir   = '/usr/local/bin',
  $user         = 'root',
  $phar_location = 'https://phar.phpunit.de',
  $auto_update   = false,
  )  {

if $version {
  wget::fetch { $phar_package:
    source      => "${phar_location}/${phar_package}-${version}.phar",
    destination => "${target_dir}/${phar_package}",
  }
}

if $version != "" {
  wget::fetch { $phar_package:
    source      => "${phar_location}/${phar_package}.phar",
    destination => "${target_dir}/${phar_package}",
  }
}

  exec { $phar_package:
    command => "chmod a+x ${target_dir}/${phar_package}",
    path    => '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin',
    cwd     => $target_dir,
    user    => $user,
    unless  => "test -x ${target_dir}/${phar_package}",
    require => Wget::Fetch[$phar_package],
  }

 if $phar_package == composer {
   if $auto_update == true {
     exec { 'composer_auto_update':
  command  => "${target_dir}/composer self-update",
  environment => [ "COMPOSER_HOME=${target_dir}" ],
  path     => '/usr/bin:/bin:/usr/sbin:/sbini:${target_dir}',
  provider => 'shell',
  user     => $user,
  require  => Exec['composer'],
   }
  }
 }
}
