sudo apt install hostapd
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo apt install dnsmasq
sudo DEBIAN_FRONTEND=noninteractive apt install -y netfilter-persistent iptables-persistent

# then edit the following
#sudo vim /etc/sysctl.d/routed-ap.conf
#interface wlan0
    #static ip_address=192.168.8.1/24
    #nohook wpa_supplicant


#sudo nano /etc/dhcpcd.conf
## https://www.raspberrypi.org/documentation/configuration/wireless/access-point-routed.md
## Enable IPv4 routing
#net.ipv4.ip_forward=1

# then run the following 
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo netfilter-persistent save

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

#sudo vim /etc/dnsmasq.conf
#interface=wlan0 # Listening interface
#dhcp-range=192.168.8.2,192.168.8.20,255.255.255.0,24h
                ## Pool of IP addresses served via DHCP
#domain=wlan     # Local wireless DNS domain
#address=/gw.wlan/192.168.8.1
                ## Alias for this router

#sudo rfkill unblock wlan


#sudo vim /etc/hostapd/hostapd.conf
#country_code=GB
#interface=wlan0
#ssid=bopiwan
#hw_mode=a
#channel=7
#macaddr_acl=0
#auth_algs=1
#ignore_broadcast_ssid=0
#wpa=2
#wpa_passphrase=whyerrless
#wpa_key_mgmt=WPA-PSK
#wpa_pairwise=TKIP
#rsn_pairwise=CCMP

