#!/bin/bash

file_path="/home/fangjun/Documents/bitbutcket/csukuangfj.github.io/python-learn-examples"

for index in 1 2 3 4 5 6 7 8 9 10 11 12 13\
			 14 15 16 17 18 19 20 21\
			 24 25 26\
			 29; do	
	echo "\\lstinputlisting[caption=ex${index}.py,language=python]{${file_path}/ex${index}.py}"
done