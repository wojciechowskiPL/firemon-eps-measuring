#!/bin/bash

OUTPUT_FILE=/tmp/eps.txt
INTERFACE=ens192
DURATION=10
RED='\033[0;31m'
NC='\033[0m'

echo "[+] This process take ${DURATION} sec"

# Tsharh
# udp port 514   - Syslog
# tcp port 18184 - OPSEC LEA
TSHARK="tshark -a duration:${DURATION} -i ${INTERFACE} tcp port 6514 or udp port 514 udp port 18184"


#Count line
echo -e "[+] Detected: $($TSHARK > $OUTPUT_FILE)  ${RED}$(cat $OUTPUT_FILE | wc -l) ${NC}EPS"

#Remove/delete the outputfile
rm $OUTPUT_FILE 2>/dev/null