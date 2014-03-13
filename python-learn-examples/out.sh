#!/bin/bash

f=a.txt
rm a.txt

for filename in ex1.py ex2.py ex3.py ex4.py ex5.py ex6.py ex7.py ex8.py ex9.py ex10.py ; do	
	echo "" >> $f
	echo "<center>$filename</center>" >> $f	
	echo "\`\`\`python" >> $f
	cat $filename >> $f
	echo "" >> $f
	echo "\`\`\`" >> $f
	echo "<center>Output of $filename</center>" >> $f
	echo "" >> $f
	python $filename >> $f	
done