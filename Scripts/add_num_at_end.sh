#############################################
 ########在文件中指定行最后加上空格和数字########
 #############################################

 ####应用gaussian bsse文件的生成####
 a="/test.html /dir1 /abc.txt"

whwu@master:~/script> a="/test.html /dir1 /abc.txt"
whwu@master:~/script> echo $a|awk '{for(i=1;i<=NF;i++){printf "--exclude="$i""}{print " "}}'
--exclude=/test.html--exclude=/dir1--exclude=/abc.txt


whwu@master:~/script> cat test1
a bcd
a edf
b wer
whwu@master:~/script> awk '$1=="a"{print $0}' test1
a bcd
a edf
whwu@master:~/script> awk '$1=="a"{printf ""$0" 1"}{print ""}' test1
a bcd 1
a edf 1

whwu@master:~/script> awk '{if($1=="a") printf ""$0" 1\n"; else printf ""$0" 2\n"}' test1
a bcd 1
a edf 1
b wer 2

whwu@master:~/script> cat test1
#p b3lyp/aug-cc-pvdz

a bcd
a edf
b wer
whwu@master:~/script> awk '{if($1=="a") printf ""$0" 1\n"; else if($1=="b")  printf ""$0" 2\n"; else printf ""$0"\n"}' test1
#p b3lyp/aug-cc-pvdz

a bcd 1
a edf 1
b wer 2

whwu@master:~/script> cat test1
#p b3lyp/aug-cc-pvdz

a bcd
a edf
b wer
c ddf

whwu@master:~/script> awk '{if($1=="a") printf ""$0" 1\n"; else if($1=="b"||$1=="c")  printf ""$0" 2\n"; else printf ""$0"\n"}' test1 # awk-if中的逻辑或    
#p b3lyp/aug-cc-pvdz

a bcd 1
a edf 1
b wer 2
c ddf 2
