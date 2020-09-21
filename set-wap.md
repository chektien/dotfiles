
# Rasbian AP

### Define wireless interface
sudo vim /etc/dhcpcd.conf

```
interface wlan0
    static ip_address=192.168.4.1/24
    nohook wpa_supplicant
```

### Enable routing of internet traffic
sudo vim /etc/sysctl.d/routed-ap.conf

```
# https://www.raspberrypi.org/documentation/configuration/wireless/access-point-routed.md
# Enable IPv4 routing
net.ipv4.ip_forward=1
```

### Config DNS server
sudo vim /etc/dnsmasq.conf

```
interface=wlan0 # Listening interface
dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h # Pool of IP addresses served via DHCP
domain=wlan # Local wireless DNS domain
address=/gw.wlan/192.168.4.1 # Alias for this router
```

### Config access point server
sudo vim /etc/hostapd/hostapd.conf

```
country_code=GB
interface=wlan0
ssid=NameOfNetwork
hw_mode=g
channel=7
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=AardvarkBadgerHedgehog
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
```

### Ensure wifi unblockedk
sudo rfkill unblock wlan

### Add single firewall rule and save the config
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"

### Load the iptables file on every boot
sudo vim /etc/rc.local

and add the following before `exit 0`

```
iptables-restore < /etc/iptables.ipv4.nat
```

### reboot
sudo reboot
