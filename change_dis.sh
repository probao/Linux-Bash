#! /bin/bash
#用于quantum calculation中的scan，改变一个键长的长度

n=10.00;
for (( i=1; i<=50; i++))
do
        echo 0$i
        echo $n
        mkdir q0$i
        cp pbs_tmole q0$i;
        cp turbo.in q0$i;
        cd q0$i;
        sed -i "s/number/$n/g" turbo.in;
        n=$(echo "$n-0.20" | bc);
        qsub pbs_tmole
        cd ..

done
