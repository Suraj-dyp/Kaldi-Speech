#! /bin/bash

#if [ ! -d G ]; then 
#mkdir G
#else
#rm -r G
#mkdir G
#fi

count=1
for filename in corpus/LM/*; do 
	if [ $filename != "corpus/LM/train.txt" ]; then
	dir_name=G/$filename
	echo "$count"
	echo "$dir_name"
#	mkdir G/$count
#	/home/nikhil/Documents/Sem3/ASR/Ass2/kaldi/src/lmbin/arpa2fst --disambig-symbol=#0 --read-symbol-table=data/lang/words.txt $filename G/$count/G.fst
	else
	echo "$count"
	echo "$filename"
	echo "This file was skipped as it is train.txt"
	fi
	count=$((count + 1))
	
done
