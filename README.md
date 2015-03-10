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

The agent service ITMAgents1 will be configured to start automatically.  The 
agent service process runs as klzagent.


## Setup

### What itmagent affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

The following pre-requisite packages will be installed.
* ksh.x86_64             : The Original ATT Korn Shell
* libstdc++.x86_64       : GNU Standard C++ Library
* libstdc++.i686         : GNU Standard C++ Library
* libgcc.i686            : GCC version 4.8 shared support library
* nfs-utils.x86_64       : NFS utilities and supporting clients and daemons for the kernel NFS server

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

Example ITM agent service status command.
Syntax: /etc/init.d/ITMAgents1 start|stop|restart|start_msg|stop_msg

ITM Port Usage - Agents
In a default configuration, agents use the following sockets,<br>
1) Connection to a TEMS port 1918. The communications string defines the protocols used. The CT_CMSLIST environment variable names the servers where a TEMS is running. The initial connection at port 1918 gives access to the Location Broker data and thus indirectly to the TEMS. However from the standpoint of configuration, this is a socket to a 1918 listening port on the server running the TEMS.<br>
2) Agent listening port at 1918+N*4096. If there is just one agent installed, the listening port will be 1918+4096 or 6014. If there are more than one agent installed, the agents contend for the listening ports. That means incidentally that there are a maximum of 15 agents using the default configuration. The listening port is used for several purposes including retrieval of real time data and receiving broadcasts about new WPA address.
3) Agent connection to Warehouse Proxy Agent or WPA. This can be at any port but recently was defaulted to 63358 or 1918+15*4096. The information is actually found from the Location Broker. The WPA registers at the hub TEMS, the Global Location Broker information is propagated to the Local Location Broker at the remote TEMS and the agent looks it up as part of the Location Broker data.
4) Internal Web Server ports. By default all Agents and most ITM processes start an internal web server. The default ports used are 1920 and 3661 [http and https]. There are several purposes including the ability to start and stop diagnostic tracing dynamically. The first ITM process owns the 1920/3661 and the others register with it. If that process stops the 1920 ownership switches to another ITM process if possible.
6) Ephemeral ports. ITM makes use of ports which are received from TCP/IP as "the next free port". These are used to communicate between ITM sub-systems.
7) Local ports. These are on address 0.0.0.0 and 127.0.0.1 which are not internet capable addresses. They are used to maintain awareness between ITM processes such as handling the internal web server switch process.
Almost every single number you see in the above description is configurable except for 4096 and local ports. So if you must make a change you can always make that change. The rest of the technote shows how to limit or control port usage.

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
