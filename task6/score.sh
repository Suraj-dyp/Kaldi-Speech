#!/bin/bash
# Copyright 2012  Johns Hopkins University (Author: Daniel Povey)
# Apache 2.0

[ -f ./path.sh ] && . ./path.sh

# begin configuration section.
cmd=run.pl
stage=0
decode_mbr=true
word_ins_penalty=0.0
min_lmwt=7
max_lmwt=17
#end configuration section.

[ -f ./path.sh ] && . ./path.sh
. parse_options.sh || exit 1;

if [ $# -ne 3 ]; then
  echo "Usage: local/score.sh [--cmd (run.pl|queue.pl...)] <data-dir> <lang-dir|graph-dir> <decode-dir>"
  echo " Options:"
  echo "    --cmd (run.pl|queue.pl...)      # specify how to run the sub-processes."
  echo "    --stage (0|1|2)                 # start scoring script from part-way through."
  echo "    --decode_mbr (true/false)       # maximum bayes risk decoding (confusion network)."
  echo "    --min_lmwt <int>                # minumum LM-weight for lattice rescoring "
  echo "    --max_lmwt <int>                # maximum LM-weight for lattice rescoring "
  exit 1;
fi

data=$1
lang_or_graph=$2
dir=$3

symtab=$lang_or_graph/words.txt

for f in $symtab $dir/lat.1.gz $data/text; do
  [ ! -f $f ] && echo "score.sh: no such file $f" && exit 1;
done

mkdir -p $dir/scoring/log

cat $data/text | sed 's:<NOISE>::g' | sed 's:<SPOKEN_NOISE>::g' > $dir/scoring/test_filt.txt

[ -x task6/fiter_script ] && fiter_cmd="task6/fiter_script"

$cmd LMWT=$min_lmwt:$max_lmwt $dir/scoring/log/best_path.LMWT.log \
  lattice-scale --inv-acoustic-scale=LMWT "ark:gunzip -c $dir/lat.*.gz|" ark:- \| \
  lattice-add-penalty --word-ins-penalty=$word_ins_penalty ark:- ark:- \| \
  lattice-best-path --word-symbol-table=$symtab \
    ark:- ark,t:- \| \
  $fiter_cmd $dir/scoring/ LMWT| exit 1;


# Note: the double level of quoting for the sed command
for qual in 'g' 'm' 'n' 'l'; do
    $cmd LMWT=$min_lmwt:$max_lmwt $dir/scoring/log/score.LMWT.log \
    cat $dir/scoring/LMWT_$qual.txt \| \
        utils/int2sym.pl -f 2- $symtab \| sed 's:\<UNK\>::g' \| \
        compute-wer --text --mode=present \
        ark:$dir/scoring/test_filt.txt  ark,p:- ">&" $dir/wer_LMWT_$qual || exit 1;
done

for qual in 'g' 'm' 'n' 'l'; do
    for x in $dir; do [ -d $x ] && grep WER $x/wer_*_$qual | utils/best_wer.sh; done
done

exit 0;
