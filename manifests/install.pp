class itmagent::install inherits itmagent {
   if $::osfamily != 'RedHat' {
      fail("Unsupported osfamily ${::osfamily}")
   }
   exec { "cp -a $src_dir/$script_file .":
      cwd     => "$dir_tmp",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
      unless  => "$itm_home/bin/cinfo -t lz",
      logoutput => "true",
   }
   exec { "tar xzf $script_file":
      cwd     => "$dir_tmp",
      path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
      unless  => "$itm_home/bin/cinfo -t lz",
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
      unless  => "$itm_home/bin/cinfo -t lz",
      logoutput => "true",
   }
}
