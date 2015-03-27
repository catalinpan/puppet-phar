# phar

#### Table of Contents

1. [Overview](#overview)
3. [Setup - The basics of getting started with phar](#setup)
    * [What phar affects](#what-phar-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

The module can fully manage .phar installation packages including composer (with auto update option), phpunit, phpdox, phploc, phpcpd any any other .phar package.

The module supports also hiera

##Setup 

### What phar affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

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

