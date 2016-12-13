#!/bin/bash

if [ $# != 1 ];then
    echo "Usage: $0 <nextHopIP>"
    exit 2
elif ! [[ $1 =~ ^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]|[0-9])$ ]];then
    echo "Argument #1 <nextHopIP> must be a valid IP address!"
    exit 3
fi
next_hop=$1

src_dir=`dirname $(readlink -f $0)`
raw_network_list=$src_dir/gfwlist.min.txt

grep -v -e "#" -e "^$" $raw_network_list | while read net
do
    ip ro add $net via $next_hop
done

