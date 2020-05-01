node default {
  package { ['build-essential', 'cmake', 'g++', 'libboost-dev', 'libboost-system-dev', 'libboost-filesystem-dev',
    'libexpat1-dev', 'zlib1g-dev', 'libxml2-dev', 'libbz2-dev', 'libpq-dev', 'libproj-dev', 'postgresql-server-dev-10',
    'postgresql-10-postgis-2.4', 'postgresql-contrib-10', 'apache2', 'php', 'php-pgsql', 'libapache2-mod-php',
    'php-pear', 'php-db', 'php-intl', 'git']:
    ensure => present
  }

  service { 'postgresql':
    ensure => running,
    enable => true
  }

  service { 'apache2':
    ensure => running,
    enable => true
  }

  #todo FIXME: move to pgsql puppet module?
  exec { '/usr/bin/createuser -s vagrant':
    user    => 'postgres',
    require => Package['postgresql-server-dev-10']
  }
  exec { '/usr/bin/createuser www-data':
    user    => 'postgres',
    require => Package['postgresql-server-dev-10']
  }

  file { '/home/vagrant/Nominatim.tar.bz2':
    source => 'https://nominatim.org/release/Nominatim-3.2.0.tar.bz2',
    mode   => '0600',
    owner  => 'vagrant',
    group  => 'vagrant'
  }

  file { '/etc/apache2/sites-available/000-default.conf':
    source => '/vagrant/provision/apach2-nominatim.conf'
  }

  Package['postgresql-server-dev-10'] ~> Service['postgresql']
  File['/etc/apache2/sites-available/000-default.conf'] ~> Service['apache2']
}
