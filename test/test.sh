#!/bin/sh

# Save test start time
START_TIME=$(date +%s)

# Execute all tests

echo
echo "Creating mmCIF/DDL object dictionary"

rm -f ./mmcif_std.odb

../bin/DictObjFileCreator -dictSdbFile ./mmcif_std.sdb \
  -o ./mmcif_std.odb 2>&1 | tee ./mmcif_std.log

chmod 644 ./mmcif_std.odb

echo
echo 'Running reading test 1'
../bin/DictObjFileReader mmcif_std.odb mmcif_std.dic > builder1.out

echo 'Running reading test 2'
../bin/DictObjFileSelectiveReader mmcif_std.odb mmcif_std.dic > builder2.out

# Save test end time
END_TIME=$(date +%s)

DIFF_TIME=$(( $END_TIME - $START_TIME ))

echo "Tests execution time is $DIFF_TIME seconds." > exectime.txt

echo
echo
cat exectime.txt
echo
echo

