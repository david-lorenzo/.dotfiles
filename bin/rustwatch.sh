#!/bin/sh

sourcef=$1
binaryf=`basename $sourcef .rs`

while true;
do
	echo Watching ... $sourcef
	inotifywait -q -e modify $sourcef
   	rustc $sourcef && ./$binaryf
done
