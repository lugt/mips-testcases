mips-linux-gnu-gcc $1 -fdump-tree-all -save-temps -O0 -c -march=mips1 -mfp32 -mabi=32
# /usr/lib/gcc-cross/mips-linux-gnu/5/cc1 -quiet -v -imultiarch mips-linux-gnu $1.c -meb -dumpbase $1.c -march=mips1 -mfp32 -mllsc -mabi=32 -auxbase a -version -o $1.s -Wformat -Wformat-security -fdump-tree-all
