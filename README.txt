------------
Stuff up next:
------------
December 15, 2019: Possible patch for iw (minor-ish) for having a saner return code.
December 20, 2019: Set up tx descriptors in run driver according to rt2x00 code => Send next patch upstream.
Jan 15, 2020:  Fix the radiotap headers in the run driver for 11n.

No-date milestones (date milestones dictate these)
--------------------------------------------------
11ac support with N : Not until everything works as expected in the 2.4GHz band.
A document to help people get started with wireless hacking on freebsd

Issues
------
wpa_supplicant does not associate with an access point complaining about invalid routing messages. Unsure if
should delve into it, or keep fixing driver?

TODO
------
Fix up the original slides from presentation earlier for 412 for future generations.

------------------------------
Stuff done / taken care of
--------------------------
Set up an access point with USB N66
Enable internet connectivity via the AP (and test on device)
Set up firewalls for packet forwarding (pf)
Read and understand parts of the run device driver
Read up on ifconfig and interface cloning
Finish reading the rtusb linux driver
Fix HDMI on fbsd

References
----------
FreeBSD:
FreeBSD device drivers: A guide for the Intrepid (Joseph Kong): Chapter 16 at the very least.
Chapter 3: ioctl is also useful

DEVD: https://forums.freebsd.org/threads/devd-guide.65668/#post-386038
Even though the link above is a forum post, it is VERY good advice on how to understand what devd is
trying to do.

# How 80211 assoc works.
https://documentation.meraki.com/MR/WiFi_Basics_and_Best_Practices/802.11_Association_process_explained: 802.11n association protcool

https://reviews.freebsd.org/D2655?id=6163 They did a revamp of the if_run and other drivers by droppinog ioctls.

---------------
Ubuntu / Linux:
----------------
https://wiki.ubuntu.com/Debug%20Symbol%20Packages
http://www.haifux.org/lectures/206/wirelessLec.pdf
https://wireless.wiki.kernel.org/en/developers/documentation/wireless-extensions
https://wireless.wiki.kernel.org/en/developers/documentation/ieee80211/802.11n
https://openofdm.readthedocs.io/en/latest/sig.html
iwconfig: man iwconfig and http://www.computerhope.com/unix/iwconfig.htm : Does not come off as useful on its own but it is.

Installing systemtap
Tut: https://sourceware.org/systemtap/SystemTap_Beginners_Guide/using-systemtap.html#install-kinfo
(since we are on Ubuntu and not Redhat spinoffs, basically apt-get install systemtap, and then install ddeb support below, then refer to the tut above again)

Installing ddeb support Ubuntu
https://wiki.ubuntu.com/Debug%20Symbol%20Packages

Misc
----
Fix trackpad on fbsd (no due date, but this is annoying) [ OUT OF PROJECT SCOPE Maybe]
Optimize battery usage when unlpugged for energy consumption. Reduce performance? Can we bypass ACPI / abstract it?
Other ideas regarding 410 kernels.

issues encountered (pending)
---------------------------------------------
* [ FIXED ] Could not access freebsd.org (or forums.freebsd.org) from a Comcast network: Fixed by enabling IPv6
* [ FIXED ] Keep getting Host Unreachable on FreeBSD12 when SSH'd into andrew linux machines, ticket open with IT Help (Fixed on Nov 8, 2019)
This was due to a *misplaced* dhclient.conf file which would keep requesting a local 10.0.0.X address on CMU's network, and keep getting
NAK'd. After enough NAKs the machine would switch to a new IP address and then boom, all persistent connections (SSH and IRC) would just
go away!
* [FIXED with EC2] Set up a persistent IRC connection with screen and erc on an external server, but keep getting "dead" screens.
  -- Difficult to stay online all the time with a laptop. (Should probably set this up on cclub machine)
  -- It is difficult to get responses on an IRC channel in a reasonable time window sometimes ("Idle Relay Chat")

Out of scope now
----------------
Get a hold of the datasheet for RT3573 (Could not find this. Making do with source code instead)
Stress the N66 access point to make it device timeout (runs so far without them showing up) -- UPDATE: Could not do this. Seems like AP portion is a bit distant into the future.
