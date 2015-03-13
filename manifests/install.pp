class itmagent::install (
)inherits itmagent {
   if $::osfamily != 'RedHat' {
      fail("Unsupported osfamily ${::osfamily}")
   }
   package { '$nfs_package':
      ensure => $nfs_ensure,
      name   => $nfs_package,
   }
   package { '$ksh_package':
      ensure => $ksh_ensure,
      name   => $ksh_package,
   }
   package { '$stdcpp_64_package':
      ensure => $stdcpp_64_ensure,
      name   => $stdcpp_64_package,
   }
   package { '$stdcpp_32_package':
      ensure => $stdcpp_32_ensure,
      name   => $stdcpp_32_package,
   }
   package { '$gcc_32_package':
      ensure => $gcc_32_ensure,
      name   => $gcc_32_package,
   }
   exec { "service rpcbind start":
      cwd       => "$dir_tmp",
      path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:",
      creates   => "$itm_home/bin/cinfo",
      unless    => "service rpcbind status",
      logoutput => "true",
   }
   exec { "mkdir -p $mnt_dir":
      cwd       => "$dir_tmp",
      path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:",
      creates   => "$mnt_dir",
      unless    => "ls $itm_home/bin/cinfo",
      logoutput => "true",
   }
   exec { "mount $nfs_options ${nfs_host}:${nfs_dir} $mnt_dir":
      cwd       => "$dir_tmp",
      path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:",
      unless    => "grep ${nfs_dir} /etc/mtab",
      creates   => "$itm_home/bin/cinfo",
      logoutput => "true",
   }
   exec { "cp -a $mnt_dir/$src_dir/$script_file .":
      cwd       => "$dir_tmp",
      path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
      creates   => "$dir_tmp/$script_file",
      unless    => "ls $itm_home/bin/cinfo",
      logoutput => "true",
   }
   exec { "tar xzf $script_file":
      cwd       => "$dir_tmp",
      path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
      unless    => "ls $itm_home/bin/cinfo",
      creates   => "$dir_tmp/$script_dir",
      logoutput => "true",
   }
   exec { "itm630agent_rhel.sh $itm_server $mnt_dir/$src_dir/$itm_dir":
      cwd       => "$dir_tmp/$script_dir",
      path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_tmp/$script_dir",
      onlyif    => "ls $mnt_dir/$src_dir/$itm_dir",
      creates   => "$itm_home/bin/cinfo",
      logoutput => "true",
   }
   exec { "umount ${nfs_host}:${nfs_dir}":
      cwd       => "$dir_tmp",
      path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:",
      onlyif    => "grep ${nfs_dir} /etc/mtab",
      unless    => "ls $itm_home/bin/cinfo",
      logoutput => "true",
   }
}
