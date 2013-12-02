#! /bin/bash

# Determine the public IP address for your DHCP system by bootstrapping

#  calls to your gateway/router

# Requires "route," available in Ubuntu package net-tools, and
# nslookup, available in Ubuntu package dnstools

# Disclaimers:
# 1) This works with Verizon FIOS using the Actiontec MI424WR Router
#    If you have another system YMMV.
#
# 2) And, as you'll no doubt note, this is set up for a Debian system,
#    specifically Ubuntu 10.04 .  Package names and installation
#    procedures for other systems WILL vary.
#

###
# Start Here:
###

#
# Get Router internal Gateway IP
# Information found on
# http://www.cyberciti.biz/faq/how-to-find-gateway-ip-address/
# If route is not installed, run
# sudo apt-get install net-tools
# and make sure /sbin is in your $PATH
# Note "U" = up, and "G" = gateway

internalip=`route -n | grep UG | awk '{print $2}'`

echo Your Gateway\'s Internal IP Address is: $internalip

# Now we need to get the name of the router.  If you don't
#  have nslookup installed, run
# sudo apt-get install dnsutils

echo -n "Your Gateways's name is: "

routername=`nslookup $internalip | grep "name =" | awk '{print $4}'`

# On the Actiontec, at least, the name has an annoying "." at the end.
# Remove it:

routername=${routername%\.}

echo $routername

echo -n "Your Public IP Address is: "

nslookup $routername | grep Address | tail -1 | awk '{print $2}'
