#!/bin/sh
sed -i \
         -e 's/#2e2e2e/rgb(0%,0%,0%)/g' \
         -e 's/#acaead/rgb(100%,100%,100%)/g' \
    -e 's/#2b2b2b/rgb(50%,0%,0%)/g' \
     -e 's/#8094a4/rgb(0%,50%,0%)/g' \
     -e 's/#343434/rgb(50%,0%,50%)/g' \
     -e 's/#d3dae3/rgb(0%,0%,50%)/g' \
	$@
