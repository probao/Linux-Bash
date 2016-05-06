格式转化coord到tmole
#!/bin/bash
#coord2tmole.sh--format transfer


#generate gaussion format
basename `pwd` > tmp
cat > $(head tmp).gjf << EOF   
# hf/3-21g

test

0 1
EOF
grep -n 'redundant$' coord > tmp2
sed -i 's/:$redundant//g' tmp2
head -n $(cat tmp2) coord > tmp3
sed -i '1d' tmp3
sed -i '$d' tmp3
awk '{printf("\t %c %f   %f   %f \n"),$4,$1*0.529177,$2*0.529177,$3*0.529177}' tmp3 >> $(head tmp).gjf
echo '' >> $(head tmp).gjf
rm tmp*


#generate tmole format
cp *.gjf  tmp.gjf

let linini=0
let linend=0
let linnum=0

grep -n '^$' tmp.gjf > null-line.txt
sed -i 's/://g' null-line.txt
let linini=$(head -2 null-line.txt | tail -1)
let linend=$(head -3 null-line.txt | tail -1)
let linnum=linend-linini-2

sed -i '1,5d' tmp.gjf
sed -i '$d' tmp.gjf

echo -e "%title\nsigle point\n%method\nENRGY :: ri-b-lyp/TZVP \n%charge\n0\n%coord xyz" > turbo.in
echo $linnum >> turbo.in
echo -e "Energy=" >> turbo.in
cat tmp.gjf >> turbo.in
echo -e "%add_control_commands\n\$disp3\nADD END\n%end" >> turbo.in  
