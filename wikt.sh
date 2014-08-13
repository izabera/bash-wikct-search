#!/bin/bash
MATCHROW=$(grep -Pe "^\d+ $1$" titles -m 1 | sed 's/ .*//')
TEMPNUM=$(grep -Pe "^\d+ $1$" titles -m 1 -n | sed 's/:.*//')
NEXTROW=`head titles -n $((TEMPNUM+1)) | tail -n 1 | sed 's/ .*//'`
head enwiktionary-latest-pages-articles.xml -n $NEXTROW | tail -n $(($NEXTROW - $MATCHROW -1))>result
grep '#' result -m 1 | sed -e 's/^..//' -e 's/\[//g' -e 's/\]//g' -e 's/ See also.*//'
rm result
