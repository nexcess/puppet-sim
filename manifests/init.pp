class sim (
  $config_file  = $sim::params::config_file,
  $config       = $sim::params::config,
)
inherits sim::params {
  if $::operatingsystem in ['RedHat', 'CentOS'] {
    validate_absolute_path($config_file)
    validate_hash($config)

    anchor {'sim::begin':}
    -> class{'::sim::config':}
    -> anchor {'sim::end':}
  }
  else {
    fail ("operating system ${::operatingsystem} is not supported by sim")
  }
}

