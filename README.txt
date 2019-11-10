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

Questions
----
Should one run simpler software on a personal machine and what to do if it is inconvenient?

References
----------
FreeBSD device drivers: A guide for the Intrepid (Joseph Kong): Chapter 16 at the very least.
