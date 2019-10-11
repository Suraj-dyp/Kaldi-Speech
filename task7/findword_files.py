import sys
import os

word_utt = open('../exp/tri1/word_alignment.txt','r')

word = sys.argv[1]

os.system('rm -f *.wav')

count = 1
for line in word_utt:
    record = line.split('\t')
    if(record[1]==word):
        file_name = record[0]+'.wav'
        outputF = 'word'+str(count)+'.wav'
        command = 'find ../corpus/data/wav -name '+file_name+' | xargs -I{} sox {} '+outputF+' trim '+record[2]+' '+record[3]
        print(command)
        os.system(command)
        count+=1