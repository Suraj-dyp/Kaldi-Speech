#!/bin/bash

script_dir="../../../tools/srilm/bin/i686-m64/ngram-count"
train_dir="/home/nikhil/Documents/Sem3/ASR/Ass2/kaldi/egs/assgmt2/recipe/corpus/LM"
trg_dir="/home/nikhil/Documents/Sem3/ASR/Ass2/kaldi/egs/assgmt2/recipe/corpus/LM"

echo "-------------------"
echo "Good-Turing 3grams"
echo "-------------------"
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/3gram.gt011 -gt1min 0 -gt2min 1 -gt3min 1 -order 3 -text $train_dir/train.txt -unk 
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/3gram.gt012 -gt1min 0 -gt2min 1 -gt3min 2 -order 3 -text $train_dir/train.txt -unk 
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/3gram.gt022 -gt1min 0 -gt2min 2 -gt3min 2 -order 3 -text $train_dir/train.txt -unk 
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/3gram.gt023 -gt1min 0 -gt2min 2 -gt3min 3 -order 3 -text $train_dir/train.txt -unk

echo "-------------------"
echo "Kneser-Ney 3grams"
echo "-------------------"
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/3gram.kn011 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 1 -kndiscount3 -gt3min 1 -order 3 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/3gram.kn012 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 1 -kndiscount3 -gt3min 2 -order 3 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/3gram.kn022 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 2 -kndiscount3 -gt3min 2 -order 3 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/3gram.kn023 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 2 -kndiscount3 -gt3min 3 -order 3 -text $train_dir/train.txt -unk

echo "-------------------"
echo "Good-Turing 4grams"
echo "-------------------"
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.gt0111 -gt1min 0 -gt2min 1 -gt3min 1 -gt4min 1 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.gt0112 -gt1min 0 -gt2min 1 -gt3min 1 -gt4min 2 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.gt0122 -gt1min 0 -gt2min 1 -gt3min 2 -gt4min 2 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.gt0123 -gt1min 0 -gt2min 1 -gt3min 2 -gt4min 3 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.gt0113 -gt1min 0 -gt2min 1 -gt3min 1 -gt4min 3 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.gt0222 -gt1min 0 -gt2min 2 -gt3min 2 -gt4min 2 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.gt0223 -gt1min 0 -gt2min 2 -gt3min 2 -gt4min 3 -order 4 -text $train_dir/train.txt -unk

echo "-------------------"
echo "Kneser-Ney 4grams"
echo "-------------------"
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.kn0111 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 1 -kndiscount3 -gt3min 1 -kndiscount4 -gt4min 1 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.kn0112 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 1 -kndiscount3 -gt3min 1 -kndiscount4 -gt4min 2 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.kn0113 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 1 -kndiscount3 -gt3min 1 -kndiscount4 -gt4min 3 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.kn0122 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 1 -kndiscount3 -gt3min 2 -kndiscount4 -gt4min 2 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.kn0123 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 1 -kndiscount3 -gt3min 2 -kndiscount4 -gt4min 3 -order 4 -text $train_dir/train.txt -unk 
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.kn0222 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 2 -kndiscount3 -gt3min 2 -kndiscount4 -gt4min 2 -order 4 -text $train_dir/train.txt -unk
../../../tools/srilm/bin/i686-m64/ngram-count -lm $trg_dir/4gram.kn0223 -kndiscount1 -gt1min 0 -kndiscount2 -gt2min 2 -kndiscount3 -gt3min 2 -kndiscount4 -gt4min 3 -order 4 -text $train_dir/train.txt -unk

echo "-------------------------"
echo "----Interpolated KN------"
echo "-------------------------"
../../../tools/srilm/bin/i686-m64/ngram-count order 3 -interpolate -kndiscount -unk -text $train_dir/train.txt -lm $trg_dir/interpolate_3_kn.lm
../../../tools/srilm/bin/i686-m64/ngram-count order 4 -interpolate -kndiscount -unk -text $train_dir/train.txt -lm $trg_dir/interpolate_4_kn.lm
../../../tools/srilm/bin/i686-m64/ngram-count order 5 -interpolate -kndiscount -unk -text $train_dir/train.txt -lm $trg_dir/interpolate_5_kn.lm

echo "Language Models prepared"
