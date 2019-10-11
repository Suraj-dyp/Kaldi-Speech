for i in  exp/tri1/ali.*.gz;
do ../../../src/bin/ali-to-phones --ctm-output exp/tri1/final.mdl \
ark:"gunzip -c $i|" -> ${i%.gz}.ctm;
done;

cat exp/tri1/*.ctm > exp/tri1/merged_alignment.txt
pushd task7
python3 phoneIds_2_phones.py 
python splitAlignments.py
python phone2pron.py
python pron2words.py
python3 findword_files.py $1
popd