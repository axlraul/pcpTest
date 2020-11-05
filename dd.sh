#!/bin/bash
echo "inicio script" >> /home/pcpuser/scripts/log.txt
i=1

while [ $i -lt 6 ]; do
        echo "loop $i" >> /home/pcpuser/scripts/log.txt
        date +"%H:%M:%S-%d/%m/%y" >> /home/pcpuser/scripts/log.txt
        sync
        echo "dd $i" >> /home/pcpuser/scripts/log.txt
        dd if=/dev/zero of=/pcp/tempfile bs=1M count=$[1024*5] >> /home/pcpuser/scripts/log.txt 2>/dev/null
        sync
        date +"%H:%M:%S-%d/%m/%y" >> /home/pcpuser/scripts/log.txt
        echo "rm $i" >> /home/pcpuser/scripts/log.txt
        rm -Rf /pcp/tempfile
        i=$((i+1))
        date +"%H:%M:%S-%d/%m/%y" >> /home/pcpuser/scripts/log.txt
done

echo "fin script" >> /home/pcpuser/scripts/log.txt
echo "***************" >> /home/pcpuser/scripts/log.txt
