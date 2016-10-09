#!/bin/sh
./TerrariaServer -x64 -config server.conf | tee /var/log/terraria/$(date +"%m_%d_%Y").log

