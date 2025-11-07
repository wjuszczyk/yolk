#!/bin/sh
if [[ $(
  sudo wg show all | grep wg0 2>&1 >/dev/null
  echo $?
) -eq 0 ]]; then
  echo "VPN: up"
else
  echo "VPN: down"
fi
