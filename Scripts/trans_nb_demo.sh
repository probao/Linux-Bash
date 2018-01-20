#!/bin/bash
# a simple demo script for copying jupyter notebooks to corresponding students'accounts.
# This script is written by ben wu
# E-mail:ben.wu@ebcn.co

let total=$(wc -l PDS-ST.txt | cut -c1-2)
let line_num=0

while [ "$line_num" -lt "$total" ]
	do
	let line_num=line_num+1
	cp notebook.tmp $(cat PDS-ST.txt | head -$line_num | tail -1)
done
