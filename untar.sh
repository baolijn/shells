#!/bin/bash

for i in `find . -maxdepth 1 -name "*.tgz"|tail -2`

do
	tar -xzvf $i -C /tmp/test01

done

