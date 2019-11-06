./compile.sh $1
../source/postprocess_cg.py
cat dest.s
