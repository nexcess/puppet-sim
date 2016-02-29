class sim (
  $crontab      = $sim::params::crontab,
  $cron_job     = $sim::params::cron_job,
  $cron_line    = $sim::params::cron_line,
  $cron_match   = $sim::params::cron_match,
  $config_file  = $sim::params::config_file,
  $config       = $sim::params::config,
)
inherits sim::params {
  if $::operatingsystem in ['RedHat', 'CentOS'] {
    validate_absolute_path($crontab)
    validate_re($cron_job, '^(present|absent)$')
    validate_string($cron_line)
    validate_string($cron_match)
    validate_absolute_path($config_file)
    validate_hash($config)

    anchor {'sim::begin':} ->
    class{'::sim::cron':} ->
    class{'::sim::config':} ->
    anchor {'sim::end':}
  }
  else {
    fail ("operating system ${::operatingsystem} is not supported by sim")
  }
}

