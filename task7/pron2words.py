# #!/usr/bin/python
# # -*- coding: utf-8 -*-
# #
# #  phons2words.py
# #
# #
# #  Created by Eleanor Chodroff on 2/07/16.



# #### issues with unicode (u'')
# import sys,csv,os,os.path,re,codecs

# # make dictionary of word: prons
# lex = {}

# with codecs.open("../data/local/dict/lexicon.txt", "rb", "utf-8") as f:
#     for line in f:
#         line = line.strip()
#         space_ind = line.find(' ')
#         columns = [line[:space_ind], line[space_ind+1:]]
#         # columns = line.split("\t")
#         # print(columns)
#         word = columns[0]
#         pron = columns[1]
#         #print pron
#         try:
#             lex[pron].append(word)
#         except:
#             lex[pron] = list()
#             lex[pron].append(word)

# # open file to write

# word_ali = codecs.open("../exp/tri1/word_alignment.txt", "wb", "utf-8")

# # read file with most information in it
# with codecs.open("../exp/tri1/final_ali.txt", "rb", "utf-8") as f:
#     for line in f:
#         line = line.strip()
#         line = line.split(" ")
#         # get the pronunciation
#         pron = line[1]
#         # look up the word from the pronunciation in the dictionary
#         word = lex.get(pron)
#         word = word[0]
#         file = line[0]
#         start = line[2]
#         end = line[3]
#         word_ali.write(file + '\t' + word + '\t' + start + '\t' + end + '\n')

#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#  phons2words.py
#
#
#  Created by Eleanor Chodroff on 2/07/16.



#### issues with unicode (u'')
import sys,csv,os,os.path,re,codecs

# make dictionary of word: prons
lex = {}
non_w = []

with codecs.open("../data/local/dict/lexicon.txt", "rb", "utf-8") as f:
    for line in f:
        line = line.strip()
        space_ind = line.find(' ')
        columns = [line[:space_ind], line[space_ind+1:]]
        # columns = line.split("\t")
        # print(columns)
        word = columns[0]
        pron = columns[1]
        #print pron
        try:
            lex[pron].append(word)
        except:
            lex[pron] = list()
            lex[pron].append(word)

# # open file to write
# print len(lex)
# exit()
word_ali = codecs.open("../exp/tri1/word_alignment.txt", "wb")

# read file with most information in it
with codecs.open("../exp/tri1/pron_alignment.txt", "rb") as f:
    for line in f:
        line = line.strip()
        line = line.split("\t")
        # get the pronunciation
        # print line
        pron = line[1]
        # look up the word from the pronunciation in the dictionary
        try:
            word = lex[pron]
            word = word[0]
            file = line[0]
            start = line[2]
            end = line[3]
            word_ali.write(file + '\t' + word + '\t' + start + '\t' + end + '\n')
        except Exception, e:
            non_w.append(pron)
            pass
# print len(non_w)
# print non_w
