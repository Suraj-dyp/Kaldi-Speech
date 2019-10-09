import sys

quaities = ['g', 'm', 'n', 'l']
root_foder = sys.argv[1]
LMWT = sys.argv[2]
files = {}

for qual in quaities:
    files[qual] = open(root_foder+LMWT+'_'+qual+'.txt', 'w+')

for line in sys.stdin:
    qual = line.split(' ')[0][-1]
    files[qual].write(line)

for qual in quaities:
    files[qual].close()