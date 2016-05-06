#!/bin/bash
#post-scan.sh用于turbomole中的scan

for (( i=1; i<=50; i++))
do
#	awk 'NR==2{print $2}' ./q0$i/energy >> tem1.txt
	awk 'NR==2{$m=($2+2514.845535+188.6452037)*2625.5;printf("%.4f\n", $m)}' ./q0$i/energy >> tem1.txt
done

j=10;
for ((i=1;i<=50;i++))
do
	echo $j >> tem2.txt
 	j=$(echo "$j-0.2" | bc);
done

paste tem2.txt tem1.txt >> post-scan.txt
