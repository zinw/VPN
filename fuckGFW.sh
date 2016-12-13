#!/bin/bash

raw_network_list=./gfwlist.min.txt
next_hop=X.X.X.X

grep -v -e "#" -e "^$" $raw_network_list | while read net
do
    ip ro add $net via $next_hop
done

