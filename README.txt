Milestones (next couple weeks)
------------------------------
Stress the N66 access point to make it device timeout (runs so far without them showing up)
Finish reading the rtusb linux driver
Get a hold of the datasheet for RT3573
Get HDMI working on the FreeBSD 12 laptop

Stuff done / taken care of
--------------------------
Set up an access point with USB N66
Enable internet connectivity via the AP (and test on device)
Set up firewalls for packet forwarding (pf)
Read and understand parts of the run device driver
Read up on ifconfig and interface cloning

Weird (indirect) issues encountered
------------------------------------
* Could not access freebsd.org (or forums.freebsd.org) from a Comcast network: Fixed by enabling IPv6
* Keep getting Host Unreachable on FreeBSD12 when SSH'd into andrew linux machines, ticket open with IT Help
* Set up a persistent IRC connection with screen and erc on an external server, but keep getting "dead" screens.
  -- Difficult to stay online all the time with a laptop.
  -- It is difficult to get responses on an IRC channel in a reasonable time window sometimes ("Idle Relay Chat")

TODO
----
Fix up the original slides from presentation earlier
Get Touchpad working on the FreeBSD 12 laptop
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


