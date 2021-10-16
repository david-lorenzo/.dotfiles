#!/usr/bin/env python3

from concurrent.futures import ThreadPoolExecutor
import ipaddress
import os

def ping_addr(host):
    res = os.system(f"ping -c 1 -W 1 {host} > /dev/null")
    if res == 0:
        print(f"OK {host}")
#    else:
#        print(f"   {host}")

hosts = [h for h in ipaddress.ip_network("192.168.1.0/24")]

executor = ThreadPoolExecutor()
executor.map(ping_addr, hosts[1:])
