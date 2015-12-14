#!/bin/bash

rm -f baseq2.tar.gz
tar --exclude='.DS_Store' --exclude '*.cfg' --exclude '*.sh' --exclude '*.so' -zcvf baseq2.tar.gz baseq2
