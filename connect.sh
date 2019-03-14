. ./config


VPN_IP=`dig $VPN_SERVER +short`
echo $VPN_IP

GATEWAY_IP=`ip route | grep default | awk '{print $3}'`
GATEWAY_DEVICE=`ip route | grep default | awk '{print $5}'`

echo $GATEWAY_IP
echo $GATEWAY_DEVICE

#DHCPでIP取得・デフォルトルート変更
dhclient $VPN_DEVICE

#VPN鯖へのルーティングを変更
ip route add $VPN_IP via $GATEWAY_IP dev $GATEWAY_DEVICE
