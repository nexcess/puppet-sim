class sim::cron {

  file_line{'sim cron job':
    ensure => $sim::cron_job,
    path   => $sim::crontab,
    line   => $sim::cron_line,
    match  => $sim::cron_match,
  }
}
