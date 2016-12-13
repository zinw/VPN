#!/bin/bash

next_hop=X.X.X.X

src_dir=`dirname $(readlink -f $0)`
raw_network_list=$src_dir/gfwlist.min.txt

grep -v -e "#" -e "^$" $raw_network_list | while read net
do
    ip ro add $net via $next_hop
done

