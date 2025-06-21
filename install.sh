#!/bin/bash

wget https://raw.githubusercontent.com/openreplay/openreplay/main/scripts/helmcharts/openreplay-cli -O /bin/openreplay 
chmod +x /bin/openreplay
# openreplay -i openreplay-railway-production.up.railway.app
openreplay -h
