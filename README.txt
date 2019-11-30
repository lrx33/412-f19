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

Week ending November 27 (yes...)
=================================
Set up system tap on Ubuntu
iwconfig / iwlist utils use the outdated wext packages, spent some time trying
to get card caps out of these, but did not work. Finally realized linux has something called nl80211/cfg80211 for this communication now. Uses the name (not confusing at all) "iw" for the tool using nl80211 which supersedes iwconfig/iwist.
iw list - does indeed detect that the cards on machine have HT capabilities.
Exploring how exactly iw queries the card for its caps.
Enter systemtap: This is like dtrace probes from fbsd,but on linux. ubuntu also has something called ddebs which are basically dbgsyms (like /usr/include/debug/ on freebsd) to help. Using systemtap, need a full call trace when doing iw set-bitrate.
It is not immediately clear if setting the bitrate is enough to drive using full 11n mode.

Nov 28

Reading the rtx2800.h and rt2x00lib.h


=======
Questions
----
Should one run simpler software on a personal machine and what to do if it is inconvenient?

References
----------
FreeBSD:
FreeBSD device drivers: A guide for the Intrepid (Joseph Kong): Chapter 16 at the very least.


Ubuntu / Linux:
https://wiki.ubuntu.com/Debug%20Symbol%20Packages
http://www.haifux.org/lectures/206/wirelessLec.pdf
https://wireless.wiki.kernel.org/en/developers/documentation/wireless-extensions
https://wireless.wiki.kernel.org/en/developers/documentation/ieee80211/802.11n
https://openofdm.readthedocs.io/en/latest/sig.html

Installing systemtap
---------------------

Tut: https://sourceware.org/systemtap/SystemTap_Beginners_Guide/using-systemtap.html#install-kinfo
(since we are on Ubuntu and not Redhat spinoffs, basically apt-get install systemtap, and then install ddeb support below, then refer to the tut above again)

Installing ddeb support Ubuntu
https://wiki.ubuntu.com/Debug%20Symbol%20Packages

