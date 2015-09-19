#!/bin/bash

raw_network_list = ./gfwlist.txt
next_hop = XXX

grep -v -e "#" -e "^$" $raw_network_list | while read net
do
    ip ro add $net via $next_hop
done

