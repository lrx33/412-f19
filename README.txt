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

EOD Reports;
------------

Daily EOD reports (End of Day)

Nov 13
Can hook up with the ieee80211 layer to signal that we want to operate in 11na or 11ng (radiocaps func in if_run was hacked to achieve this)

November 27 (yes...)
Set up system tap on Ubuntu
iwconfig / iwlist utils use the outdated wext packages, spent some time trying
to get card caps out of these, but did not work. Finally realized linux has something called nl80211/cfg80211 for this communication now. Uses the name (not confusing at all) "iw" for the tool using nl80211 which supersedes iwconfig/iwist.
iw list - does indeed detect that the cards on machine have HT capabilities.
Exploring how exactly iw queries the card for its caps.
Enter systemtap: This is like dtrace probes from fbsd,but on linux. ubuntu also has something called ddebs which are basically dbgsyms (like /usr/include/debug/ on freebsd) to help. Using systemtap, need a full call trace when doing iw set-bitrate.
It is not immediately clear if setting the bitrate is enough to drive using full 11n mode.

Nov 28
Reading the rtx2800.h and rt2x00lib.h
Playing around with iw and iwconfig and enabling debug in the run driver.
IT is not fully clear how exactly the 80211 frame is created, although run's tx and tx_desc are close contestants.
Even after setting mode to 11ng using ifconfig, as soon as association happens with an AP, the mode switches back to
no N. Investigating.

Nov 29
Wireless packet capture! Maybe should have done this earlier.
Seems like the protocol works : probe req / resp -> auth -> assoc req resp.
The 11n thingy is already advertised in the probe request phase and the response depends on it.
The 11n thingy doesn't seem to affect auth step, but does afffect assoc.
Captured the entire transaction on rt2x00 and for run. iwm (onboard intel freebsd) doesn't support monitor mode.
Borrowed a friend's linux machine and ran capture frames. As we are only interested in N for now (ng to be precise)
I disabled the home wifi's 5 ghz completely to force 11g modes (autoselect keeps flipping otherwise).

It is evident that freebsd can;t do N, the probe request doesn't advertise a ton of HT stuff, while linux does.
Next step is to figure out where exactly we can add this code to the run driver and how much of this is handled
in hardware vs host framing logic.

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

https://reviews.freebsd.org/D2655?id=6163 They did a revamp of the if_run and other drivers by dropping ioctls.

---------------
Ubuntu / Linux:
----------------
https://wiki.ubuntu.com/Debug%20Symbol%20Packages
http://www.haifux.org/lectures/206/wirelessLec.pdf
https://wireless.wiki.kernel.org/en/developers/documentation/wireless-extensions
https://wireless.wiki.kernel.org/en/developers/documentation/ieee80211/802.11n
https://openofdm.readthedocs.io/en/latest/sig.html

iwconfig: man iwconfig
          and http://www.computerhope.com/unix/iwconfig.htm : Does not come off as useful on its own but it is.

Installing systemtap
Tut: https://sourceware.org/systemtap/SystemTap_Beginners_Guide/using-systemtap.html#install-kinfo
(since we are on Ubuntu and not Redhat spinoffs, basically apt-get install systemtap, and then install ddeb support below, then refer to the tut above again)

Installing ddeb support Ubuntu
https://wiki.ubuntu.com/Debug%20Symbol%20Packages

