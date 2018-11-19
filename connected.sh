#!/bin/bash

next_hop=$ifconfig_local

# coreutils package containing greadlink (GNU readlink)
# brew install coreutils
src_dir=`gdirname $(greadlink -f $0)`
raw_network_list=$src_dir/gfwlist.min.txt

grep -v -e "#" -e "^$" $raw_network_list | while read net
do
    ip ro add $net via $next_hop
done

