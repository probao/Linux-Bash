#!/bin/bash
# This script writtern by benwu(ecustwwh@163.com) can generate bsse file.
# It is the origin version(v1) which is not very good and just focus on Zhou Li's system as well as simple dimer.
# Zhou Li also need to change some number artificially.
# I know how to update this script in the next version.
# I will write the advanced script when I am free.


grep -n '^$' $1 | sed 's/://g' > null-line.txt
let first_line=$(head -2 null-line.txt | tail -1)
let second_line=first_line+1
let forth_line=$(head -3 null-line.txt | tail -1)
let third_line=forth_line-1

sed -n "1, $first_line p" $1 >> bsse.tmp

sed -n "$second_line, $third_line p" $1 > add_number.tmp
awk '{if($1=="Br" ) printf ""$0" 2\n"; else if($1=="C" || $1=="O" || $1 == "H" || $1=="N" || $1=="I" ) printf ""$0" 1\n"; else printf ""$0"\n"}' add_number.tmp > add_number2.tmp
cat add_number2.tmp >> bsse.tmp

sed -n "$forth_line, $ p" $1 >> bsse.tmp

cat bsse.tmp > $1
rm *.txt *.tmp 
