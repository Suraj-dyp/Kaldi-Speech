phones = open('../data/lang/phones.txt','r')
ctm = open('../exp/tri1/merged_alignment.txt','r')

final_ali = open('../exp/tri1/final_ali.txt','w')
id2phone = {}
for line in phones:
    c = line.split(" ")
    # print(c)
    id2phone[c[1]] = c[0]
for line in ctm:
    record = line.split(" ")
    # print(record)
    record[-1] = id2phone[record[-1]]
    final_ali.write(" ".join(record))
    final_ali.write("\n")
final_ali.close()
phones.close()
ctm.close()
print("done")
