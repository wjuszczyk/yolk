#!/bin/sh
VPN=$(sudo wg show | awk '/wg0/ {print $2}')

if [ -n ${VPN} ]; then
  echo "VPN: ${VPN}"
else
  echo "VPN: down"
fi
