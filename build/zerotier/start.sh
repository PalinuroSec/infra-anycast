ip4=${ip4[@]}
ip6=${ip6[@]}
gw4=${gw4}
gw6=${gw6}

dn="dummy0"

sleep .5

modprobe dummy || true

ip link set $dn down &> /dev/null
ip link del dev $dn type dummy &> /dev/null

ip link add $dn type dummy
ip link set $dn up

if [ "" == "`cat /etc/iproute2/rt_tables | grep anycast`" ]; then
 echo '666       anycast' >> /etc/iproute2/rt_tables
fi

/etc/init.d/zerotier-one start

bash /connect2anycast.sh -u $username -p $password -r $region -a $as

zerotier-cli dump


for ip in ${ip4[@]}; do
 ip -4 addr add dev $dn $ip
 ip -4 rule add from $ip table anycast
done

ip -4 route add default via $gw4 table anycast

for ip in ${ip6[@]}; do
 ip -6 addr add dev $dn $ip
 ip -6 rule add from $ip table anycast
done

ip -6 route add default via $gw6 table anycast