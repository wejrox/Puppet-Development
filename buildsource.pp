# Builds a souce file given with options specified
define buildsource(
  $dir     = $title,
  $user    = 'root',
  $path    = '/usr/bin:/bin',
  $timeout = '0',
  $options = ''
) {

  $options_real = join([$options], ' ')

  Exec {
    user    => $user,
    cwd     => $dir,
    timeout => $timeout,
    path    => $path,
  }

  exec { "./configure in ${dir}":
    command => "./configure ${options_real}",
  } ->

  exec { "make in ${dir}":
    command => 'make',
  } ->

  exec { "make install in ${dir}":
    command => 'make install',
  }

}