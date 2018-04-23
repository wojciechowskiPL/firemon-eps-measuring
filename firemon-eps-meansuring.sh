#!/bin/bash
 
output_file=/tmp/eps.txt
interface=ens192
 
#Tshark
tshark="tshark -a duration:10 -i $interface udp port 514"
 
#Tshark log to file
$tshark > $output_file
 
#Counting line
cat $output_file | wc -l
 
#Remove/delete the outputfile`
rm $output_file 2>/dev/null
