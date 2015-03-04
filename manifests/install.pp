class itmagent::install inherits itmagent {

   exec { "cp -a $mount_dir/$script_file .":
      cwd     => "$dir_dest",
      path    => "/usr/local/bin/:/bin/",
      logoutput => "true",
   }

   exec { "tar xzf $script_file":
      cwd     => "$dir_dest",
      path    => "/usr/local/bin/:/bin/",
      logoutput => "true",
   }

   exec { "prereq_inst.sh":
      cwd     => "$dir_dest/$script_dir",
      path    => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_dest/$script_dir",
      logoutput => "true",
   }

   exec { "itm630agent_rhel.sh $itm_server":
      cwd     => "$dir_dest/$script_dir",
      path    => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_dest/$script_dir",
      #path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
      #unless  => " $itm_home/bin/cinfo -t lz"
      logoutput => "true",
   }


}
