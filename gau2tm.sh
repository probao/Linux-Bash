#!/bin/bash
#将高斯文件转成tmole文件

ls *.gjf > gjf.list
let docnum=$(wc -l gjf.list | cut -c1-2)
gjfnum=0
let linini=0
let linend=0
let linnum=0
cp gjf.list doc.list
sed -i 's/.gjf//g' doc.list
while [ "$gjfnum" -lt "$docnum" ]
        do
        let gjfnum=gjfnum+1
	mkdir $(head -$gjfnum doc.list | tail -1)
#	mv $(head -$gjfnum gjf.list | tail -1) $(head -$gjfnum doc.list | tail -1)
#	cd $(head -$gjfnum doc.list | tail -1)

grep -n '^$' $(head -$gjfnum gjf.list | tail -1) > null-line.txt
sed -i 's/://g' null-line.txt
let linini=$(head -2 null-line.txt | tail -1)
let linend=$(head -3 null-line.txt | tail -1)
let linnum=linend-linini-2
#cat head.txt > turbo.in
echo -e "%title\nsigle point\n%method\nENRGY :: ri-mp2/def2-SVP \n%charge\n0\n%coord xyz" > turbo.in
echo $linnum >> turbo.in
echo "" >> turbo.in
let linend=linend-1
head -$linend $(head -$gjfnum gjf.list | tail -1) > coord.txt
tail -$linnum coord.txt >> turbo.in
echo "%end" >> turbo.in
rm coord.txt null-line.txt

mv turbo.in $(head -$gjfnum doc.list | tail -1)
cp pbs_tmole $(head -$gjfnum doc.list | tail -1)/pbs_tmole
done

