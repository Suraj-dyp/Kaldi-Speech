#  phons2words.py
#
#
#  Created by Eleanor Chodroff on 2/07/16.

import sys,re,glob

pron_ali=open("../exp/tri1/pron_alignment.txt",'w')
pron=[]
start = 0.00
end = 0.00
files = glob.glob('../exp/tri1/[1-9]*.txt')

# process each file
for filei in files:
    print filei
    f = open(filei, 'r')
    header = False
    # pron_ali.write('\n')
    for line in f:
    	if header:
    		header = False
    		continue
        line=line.split(" ")
        file=line[0]
        file = file.strip()
        phon_pos=line[4][:-1]
        #print phon_pos
        if phon_pos == "SIL":
            phon_pos = "SIL_S"
        phon_pos=phon_pos.split("_")
        # print phon_pos
        phon=phon_pos[0]
        pos=phon_pos[1]
        #print pos
        if pos == "B":
            start=line[2]
            pron.append(phon)
        if pos == "S":
            start=line[2]
            end=float(line[3])
            pron.append(phon)
            pron_ali.write(file + '\t' + ' '.join(pron) +'\t'+ str(start) + '\t' + str(end)+'\n')
            pron=[]
        if pos == "E":
            # end=line[3]
            end = float(line[2]) + float(line[3]) - float(start) 
            pron.append(phon)
            pron_ali.write(file + '\t' + ' '.join(pron) +'\t'+ str(start) + '\t' + str(end)+'\n')
            pron=[]
        if pos == "I":
            pron.append(phon)