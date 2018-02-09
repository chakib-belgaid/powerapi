#!/bin/bash    
    
#$@ >> /dev/null & 
$@ &
pid=$!
./bin/powerapi modules procfs-cpu-simple   monitor --frequency 200  --pids "$pid" --file "Sample.log" &
pidapi=$!
wait $pid
sleep 2 
kill -9 $pidapi &
echo "0" >"Sample.power"
cat "Sample.log" |egrep -o "power=.*" |  tr -d 'power=|mW'  >> "Sample.power" 
awk '{s+=$1} END {print s/5}' "Sample.power"
rm -f "Sample.log"

#echo "hello world"*