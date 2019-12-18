./compile.sh $1
org=$1
mv ${org%%.*}.s src.s 
../source/postprocess_cg.py
cat dest.s
