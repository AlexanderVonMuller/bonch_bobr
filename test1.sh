#!/bin/sh

if [ $# -lt 3 ] ; then
    echo "Usage: $0 <file> <first> <last>" >& 2
    exit 1
fi

SAVE_IFS=$IFS
IFS='\n'

cat $1 | tail -n +$2 | head -$(($3-$2)) | {
    max_len=0 ; max_idx=-$2 ; i=0
    while read -r a ; do
        count=`echo $a | wc -m`
        if [ $count -ge $max_len ] ; then
            max_len=$count
            max_idx=$i
        fi
        i=$(($i+1))
    done
    echo "res is $(($max_idx+$2))"
}

IFS=$SAVE_IFS
