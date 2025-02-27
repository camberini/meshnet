# Configure users
/user set 0 name=admin password=ADMIN_PASSWORD
/user add name=me group=read

# Set the wAP identity
/system identity
set name="wAP"

# Configure time
/system clock
set time-zone-name=America/Los_Angeles

# Configure bridge
/interface bridge
add name=bridge

/interface bridge port
add bridge=bridge interface=ether1
add bridge=bridge interface=wlan1
add bridge=bridge interface=wlan2

# Disable NAT
/ip firewall nat
set numbers=0 disabled=yes

# Disable firewall filters
/ip firewall filter
set numbers=1 disabled=yes
set numbers=2 disabled=yes
set numbers=3 disabled=yes
set numbers=4 disabled=yes
set numbers=5 disabled=yes
set numbers=6 disabled=yes
set numbers=7 disabled=yes
set numbers=8 disabled=yes
set numbers=9 disabled=yes
set numbers=10 disabled=yes

# Configure DHCP
/ip dhcp-server
set [ find interface=bridge ] disabled=yes
/ip dhcp-client
add dhcp-options=hostname,clientid \
disabled=no \
interface=bridge

# Configure wireless access point
/interface wireless security-profiles
set [ find default=yes ] \
authentication-types=wpa2-psk \
mode=dynamic-keys \
supplicant-identity="wAP" \
wpa-pre-shared-key=dwebcamp \
wpa2-pre-shared-key=dwebcamp

/interface wireless
set [ find default-name=wlan1 ] \
disabled=no \
country="united states3" \
band=2ghz-b/g/n \
channel-width=20/40mhz-XX \
frequency=auto \
wireless-protocol=802.11 \
distance=indoors \
mode=ap-bridge \
ssid="dwebcamp 2.4G" \
security-profile=default

set [ find default-name=wlan2 ] \
disabled=no \
country="united states3" \
band=5ghz-a/n/ac \
channel-width=20/40/80mhz-XXXX \
frequency=auto \
wireless-protocol=802.11 \
distance=indoors \
mode=ap-bridge \
ssid="dwebcamp" \
security-profile=default
