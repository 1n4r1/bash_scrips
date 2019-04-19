#! /usr/bin/bash
#
# script for enum subdomains
#

if [ $# -ne 1 ]; then
    echo "Need one domain file."
    exit 1
fi

FILE=$1
for line in `cat ${FILE}`
do
    dig $line 2> /dev/null | grep "$line" | grep -v ";"
done
