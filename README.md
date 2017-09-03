GlusterFS Cluster Sandbox
=========================

This little sandbox spins up a GlusterFS cluster containing a distributed  volume on three servers.

## What you get

Why three servers? In this scenario two servers can fail.
In total five virtual machines are created. Four Storage nodes (GlusterFS calls them peers) and a client.

The storage nodes are based on Arch Linux and the client is a CentOS 7. You can of course use CentOS on the storage nodes but I don't like CentOS. But that's nothing I want to discuss here now :-)

## Dependencies

This sandbox uses VirtualBox, Vagrant and ansible. VirtualBox provides the platform independant virtualization for virtual machines, vagrant manages them and ansible does the provisioning of them all together.

## Spinning up the GlusterFS cluster

* Check out this repo into a directory of choice
* Run `vagrant up` and wait until you get the prompt back. This could take some time so I recommend grabbing a beer now :-)
* Run `ansible-playbook deploy-gluster.yml`

If no error occured you are ready to go! The GlusterFS cluster and a client was successfully installed. Running `vagrant status` should return something like this:
```
Current machine states:

gluster1                  running (virtualbox)
gluster2                  running (virtualbox)
gluster3                  running (virtualbox)
gluster4                  running (virtualbox)
client                    running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

Connect now to the client with `vagrant ssh client`. If you want to connect to a GlusterFS server you only have to excahnge `client` with the wanted name (for example `gluster2`).

You can become root with `su - root` and the password `vagrant`. This applies for all created servers.

After becoming root you are able to write to /mnt. There is the GlusterFS Cluster mounted using FUSE.

## Handy vagrant commands

These vagrant commands may help you playing around. They have to be issues on your computer in the cloned folder.

`vagrant status` -> Overview about the virtual machines

`vagrant destroy -f` -> Destroys all virtual machines

`vagrant destroy gluster2 -f` -> Destroys only gluster2

`vagrant up` -> Spins up virtual machines which are currently down

`vagrant up gluster2` -> Spins up gluster2 virtual machine if currently down

`vagrant halt gluster2` -> Halts gluster2 virtual machine


## Handy GlusterFS commands

Every command is executed as root on the storage nodes:

`gluster peer status` -> Provides information about connected and disconnected peers

`gluster volume info` -> Provides informations about configured volumes

## Questions

A few questions to think about:

* How many bricks can fail until the volume is unusable?
* How many peers can fail until the volume is unusable?
* gluster1.example.lan is given in the mount point on the client. What happens when that node is not available?
* How is the available storage calculated?

Remember: You can't destroy anything productive! If you f*ck up destroy everything and spin up a fresh new environment.

Don't forget to destroy everything after you are done playing around!

## Further reading

Creating GlusterFS Cluster on CentOS 7: https://wiki.centos.org/HowTos/GlusterFSonCentOS

Setting up GlusterFS Server Volumes: https://gluster.readthedocs.io/en/latest/Administrator%20Guide/Setting%20Up%20Volumes/
