#!/bin/bash

if [ -d "/shared" ] && [ -v CHALLENGE_NAME ]; then
   cp /pwnable /shared/$CHALLENGE_NAME.bin
   md5sum --tag /pwnable > /shared/$CHALLENGE_NAME.bin.md5
fi;

while [ true ]; do
   # If we run with su, it is resulting in zombie process
   socat -dd TCP4-LISTEN:9000,fork,reuseaddr EXEC:"qemu-ppc /pwnable",pty,setuid=bob,echo=0,raw,iexten=0
   sleep 1
done;
