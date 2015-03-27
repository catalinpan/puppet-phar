# phar

#### Table of Contents

1. [Overview](#overview)
3. [Setup - The basics of getting started with phar](#setup)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

The module can fully manage .phar installation packages including composer (with auto update option), phpunit, phpdox, phploc, phpcpd and any other .phar package.

The module supports also hiera

### Setup Requirements 

Puppet-phar module requires maestrodev/wget module.

## Usage

     include phar

       phar::package {'phpunit':
               phar_location => 'https://phar.phpunit.de',
               }

       phar::package {'phpdox':
               phar_location => 'http://phpdox.de',
               }

       phar::package {'composer':
               phar_location => 'https://getcomposer.org',
               auto_update => true,
               }

 Hiera Usage

       phar_package:
          'phpunit':
               phar_location: 'https://phar.phpunit.de'
          'composer':
               phar_location: 'https://getcomposer.org'
               auto_update: true
          'phpdox':
                phar_location: 'https://phar.phpunit.de'
                target_dir: '/usr/local/bin'


## Limitations

This module has been tested only on CentOS.

