# Script to put wlan1 into monitor mode
# creating wlan1 interface from run0 device

ifconfig wlan1 destroy
ifconfig wlan1 create wlanmode monitor wlandev run0
ifconfig wlan1 media OFDM/9Mbps mode 11a mediaopt monitor

# Need to be on 5ghz spectrum (Specific channel)
ifconfig wlan1 channel 36
ifconfig wlan1 monitor
ifconfig wlan1 up
