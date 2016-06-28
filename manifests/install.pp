class itmagent::install (
) inherits itmagent {
   case $::osfamily {
     'RedHat': {
        if $::operatingsystemmajrelease + 0 > 7 {
          notice("Class['itmagent::install']: Unsupported operating system majrelease ${::operatingsystemmajrelease}")
        } elsif $::operatingsystemmajrelease + 0 <= 7 {
          # notice ??
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
          exec { "cp -a $src_dir/$script_file .":
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
          exec { "itm630agent_rhel.sh $itm_server $src_dir/$itm_dir":
             cwd       => "$dir_tmp/$script_dir",
             path      => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$dir_tmp/$script_dir",
             onlyif    => "ls $src_dir/$itm_dir",
             creates   => "$itm_home/bin/cinfo",
             logoutput => "true",
          }
        }
      }
      default: {
         notice("Class['itmagent::install']: Unsupported osfamily: ${::osfamily}")
      }
   }
}
