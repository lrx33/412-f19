Milestones (next couple weeks)
------------------------------
Stress the N66 access point to make it device timeout (runs so far without them showing up)
Finish reading the rtusb linux driver
Get a hold of the datasheet for RT3573
Fix HDMI on fbsd
Fix trackpad on fbsd

Milestones (extras?)
Optimize battery usage when unlpugged for energy consumption. Reduce performance? Can we bypass ACPI / abstract it?

Stuff done / taken care of
--------------------------
Set up an access point with USB N66
Enable internet connectivity via the AP (and test on device)
Set up firewalls for packet forwarding (pf)
Read and understand parts of the run device driver
Read up on ifconfig and interface cloning

Weird (indirect) issues encountered (pending)
---------------------------------------------
* [ FIXED ] Could not access freebsd.org (or forums.freebsd.org) from a Comcast network: Fixed by enabling IPv6

* [ FIXED ] Keep getting Host Unreachable on FreeBSD12 when SSH'd into andrew linux machines, ticket open with IT Help (Fixed on Nov 8, 2019)
This was due to a *misplaced* dhclient.conf file which would keep requesting a local 10.0.0.X address on CMU's network, and keep getting
NAK'd. After enough NAKs the machine would switch to a new IP address and then boom, all persistent connections (SSH and IRC) would just
go away!

* Set up a persistent IRC connection with screen and erc on an external server, but keep getting "dead" screens.
  -- Difficult to stay online all the time with a laptop. (Should probably set this up on cclub machine)
  -- It is difficult to get responses on an IRC channel in a reasonable time window sometimes ("Idle Relay Chat")

TODO
----
Fix up the original slides from presentation earlier
Understand how the RT3573 works under the hood

References
----------
FreeBSD device drivers: A guide for the Intrepid (Joseph Kong): Chapter 16 at the very least.

Chapter 3: ioctl is also useful

https://www.computerhope.com/unix/iwconfig.htm : Does not come off as useful on its own but it is.

DEVD: https://forums.freebsd.org/threads/devd-guide.65668/#post-386038
Even though the link above is a forum post, it is VERY good advice on how to understand what devd is
trying to do.

https://documentation.meraki.com/MR/WiFi_Basics_and_Best_Practices/802.11_Association_process_explained: 802.11n association protcool


Useful links
------------
https://reviews.freebsd.org/D2655?id=6163 They did a revamp of the if_run and other drivers by dropping ioctls.

Daily EOD reports (End of Day)

Nov 13: Can hook up with the ieee80211 layer to signal that we want to operate in 11na or 11ng (radiocaps func in if_run was hacked to achieve this)

linux/drivers/net/wireless/ralink/rt2x00/
---------------
