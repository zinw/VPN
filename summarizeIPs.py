#!/usr/bin/env python
# encoding: utf-8

from netaddr import IPSet
from netaddr.core import AddrFormatError

IN_IP_LIST_FILE = 'gfwlist.txt'
OUT_IP_LIST_FILE = 'gfwlist.min.txt'

def summarizeIPs(inFile, outFile):
    netSet = IPSet()
    with open(inFile, 'r') as f:
        for line in f.readlines():
            net = IPSet()
            try:
                net.add(line.strip())
            except AddrFormatError:
                continue
            else:
                netSet = netSet | net
    netMin = netSet.iter_cidrs()
    with open(outFile, 'w') as f:
        for net in netMin:
            f.write('{}\n'.format(net))

if __name__ == '__main__':
    summarizeIPs(IN_IP_LIST_FILE, OUT_IP_LIST_FILE)