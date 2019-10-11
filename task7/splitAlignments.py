#!/bin/sh

#  splitAlignments.py
#  
#
#  Created by Eleanor Chodroff on 3/25/15.
#
#
#
import sys,csv
results=[]

#name = name of first text file in final_ali.txt
#name_fin = name of final text file in final_ali.txt

name = "SWH-05-20101106_16k-emission_swahili_05h30_-_06h00_tu_20101106_part10"
name_fin = "SWH-05-20101110_16k-emission_swahili_15h00_-_16h00_tu_20101110_part99"
try:
    with open("../exp/tri1/final_ali.txt") as f:
        next(f) #skip header
        for line in f:
            columns=line.split(" ")
            name_prev = name
            name = columns[1]
            if (name_prev != name):
                try:
                    with open((name_prev)+".txt",'w') as fwrite:
                        writer = csv.writer(fwrite)
                        fwrite.write("\n".join(results))
                        fwrite.close()
                #print name
                except Exception, e:
                    print "Failed to write file",e
                    sys.exit(2)
                del results[:]
                results.append(line[0:-1])
            else:
                results.append(line[0:-1])
except Exception, e:
    print "Failed to read file",e
    sys.exit(1)
# this prints out the last textfile (nothing following it to compare with)
try:
    with open((name_prev)+".txt",'w') as fwrite:
        writer = csv.writer(fwrite)
        fwrite.write("\n".join(results))
        fwrite.close()
                #print name
except Exception, e:
    print "Failed to write file",e
    sys.exit(2)