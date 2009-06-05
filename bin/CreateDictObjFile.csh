#!/bin/csh -f
#
# File: CreateDictObjFile.csh
# Date: 15-April-2004  J. Westbrook
#

if ("$1" == "" ) then 
   echo "Usage:  $0 <Dictionary name (e.g. mmcif_pdbx)>"
   exit 1
endif

set d = "$1"

if (! -e sdb/$d.sdb ) then 
   echo "Missing dictionary SDB file sdb/$d.sdb"
   exit 1
endif

cd odb

set log = "$d.log"

rm -f ./$d.odb

../bin/DictObjFileCreator -dictSdbFile ../sdb/$d.sdb -o $d.odb >& $log

chmod 644 $d.odb

cd -

#
