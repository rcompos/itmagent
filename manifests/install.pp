class itmagent::install inherits itmagent {

#  $application_url =
#    "${maven_repo}/${_group_id}/${artifactid}/${version}/${artifactid}-${version}.${packaging}"
#
#  ::wget::fetch { $application_url:
#    destination => "${catalina_base}/webapps/${war_name}", 
#    cache_dir   => '/var/cache/wget',
#    cache_file  => "${artifactid}-${version}.${packaging}",
#    execuser   => 'tomcat',
#  }

#   file { 'test.txt':
#      path  => '/tmp/test.txt',
#      mode  => '0644',
#      source => "puppet:///modules/itmagent/test.txt",
#   }

#   exec { "touch ${dir_dest}/${itm_file}":
#      cwd     => "${dir_dest}",
#      path    => '/usr/local/bin/:/bin/',
#   }

#   include wget
#   wget::fetch { "$url_src":
#      destination => "$dir_dest/$itm_file", 
#   }
#
   exec { "cp -a $mount_dir/$script_file .":
      cwd     => "$dir_dest",
      path    => "/usr/local/bin/:/bin/",
   }

   exec { "tar xzf $script_file":
      cwd     => "$dir_dest",
      path    => "/usr/local/bin/:/bin/",
   }

   exec { "./itm630agent_rhel.sh $itm_server":
      cwd     => "$dir_dest/$script_dir",
      path    => ".:/usr/local/bin/:/bin/",
      # path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
#      unless  => " $itm_home/bin/cinfo -t lz"
   }


}
