#!/bin/bash

for i in `find . -maxdepth 1 -name "*.sh"|tail -2`

do
	tar -czvf $i.tgz $i

done

