class itmagent::install inherits itmagent {

   exec { "cp -a $mount_dir/$script_file .":
      cwd     => "$dir_dest",
      path    => "/usr/local/bin/:/bin/",
   }

   exec { "tar xzf $script_file":
      cwd     => "$dir_dest",
      path    => "/usr/local/bin/:/bin/",
   }

   exec { "prereq_inst.sh":
      cwd     => "$dir_dest/$script_dir",
      path    => "$dir_dest/$script_dir/:/usr/local/bin/:/bin/",
   }

   exec { "itm630agent_rhel.sh $itm_server":
      cwd     => "$dir_dest/$script_dir",
      #path    => ".:/usr/local/bin/:/bin/",
      path    => "$dir_dest/$script_dir/:/usr/local/bin/:/bin/",
      # path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
#      unless  => " $itm_home/bin/cinfo -t lz"
   }


}
