#!/bin/bash

raw_network_list = ./gfwlist.txt

grep -v -e "#" -e "^$" $raw_network_list | while read net
do
    ip ro del $net
done

