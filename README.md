# itmagent

#### Table of Contents

1. [Overview](#overview)
2. [Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with itmagent](#setup)
    * [What itmagent affects](#what-itmagent-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with itmagent](#beginning-with-itmagent)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module to install IBM Tivoli Monitoring (ITM) 6.3.0 Agent on RHEL6.
Extracted ITM 6.3.0 Agent install directory expected on network or local
filesystem. 

## Description

The itmagent Puppet module installs IBM Tivoli Monitoring (ITM) 6.3.0 Agent on
RHEL 5 and 6 and CentOS 5 and 6. The IBM Tivoli Enterprise Monitoring Server 
(TEMS) hostname or IP address must be specified as a parameter in Puppet console.

## Setup

### What itmagent affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

The following pre-requisite packages will be installed.
* ksh.x86_64             The Original ATT Korn Shell
* libstdc++.x86_64       GNU Standard C++ Library
* libstdc++.i686         GNU Standard C++ Library
* libgcc.i686            GCC version 4.8 shared support library
* nfs-utils.x86_64       NFS utilities and supporting clients and daemons for the kernel NFS server

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

The module attempts to execute the install.sh script located on a remote
NFS filesystem.  The NFS hostname or IP address and filesystem parameters 
must be specified initially.  The module mounts the NFS filesystem and
unmounts it when done.


### Beginning with itmagent

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

The following paramaters should be defined in Puppet console before assigning
this class to any nodes.

itm_server	Hostname or IP address of TEMS.
nfs_host        Hostname or IP address of NFS server.    
nfs_dir         Location of NFS directory.
nfs_options	Default '-t nfs'


## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
