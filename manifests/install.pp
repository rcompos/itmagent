class itmagent::install inherits itmagent {
   if $::osfamily != 'RedHat' {
      fail("Unsupported osfamily ${::osfamily}")
   }
   #notify{"IBM Tivoli Monitoring Agent $itm_version":}
   exec { "yum -y install nfs-utils.x86_64":
      cwd     => "$dir_tmp",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_tmp/$script_dir",
      unless  => "which rpcbind",
      logoutput => "true",
   }
   exec { "service rpcbind start":
      cwd     => "$dir_tmp",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_tmp/$script_dir",
      unless  => "service rpcbind status",
      logoutput => "true",
   }
   exec { "mkdir -p $mnt_dir":
      cwd     => "$dir_tmp",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_tmp/$script_dir",
      unless  => "ls $mnt_dir",
      logoutput => "true",
   }
   exec { "mount $nfs_options ${nfs_host}:${nfs_dir} $mnt_dir":
      cwd     => "$dir_tmp",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_tmp/$script_dir",
      unless  => "grep ${nfs_dir} /etc/mtab",
      logoutput => "true",
   }
   exec { "cp -a $src_dir/$script_file .":
      cwd     => "$dir_tmp",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
      unless  => "ls $itm_home/bin/cinfo",
      logoutput => "true",
   }
   exec { "tar xzf $script_file":
      cwd     => "$dir_tmp",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
      unless  => "ls $itm_home/bin/cinfo",
      logoutput => "true",
   }
   exec { "prereq_inst.sh":
      cwd     => "$dir_tmp/$script_dir",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_tmp/$script_dir",
      unless  => "which ksh",
      logoutput => "true",
   }
   exec { "itm630agent_rhel.sh $itm_server $src_dir/$itm_dir":
      cwd     => "$dir_tmp/$script_dir",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_tmp/$script_dir",
      unless  => "ls $itm_home/bin/cinfo",
      logoutput => "true",
   }
}
