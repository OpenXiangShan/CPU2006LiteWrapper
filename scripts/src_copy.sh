#!/bin/bash

echo "SPEC="$SPEC
#SPEC=/www/SPEC2006/cpu2006-1.2
SPEC_BM=$SPEC/benchspec/CPU2006
echo "SPEC_BM="$SPEC_BM

cases=$(find $SPEC_BM -maxdepth 1 -type d -name '[0-9]*' -exec basename {} \;)
echo "$cases"

# TEST_DIR=/www/CPU2006LiteWrapper/scripts/test_copy_dir
# for case in $cases; do
#     mkdir -p $TEST_DIR/$case/src
#     echo "Ready to copy $SPEC_BM/$case/src into "
#     cp -r $SPEC_BM/$case/src $TEST_DIR/$case

#     if [ "$case" = "400.perlbench" ]; then
#         break
#     fi    
# done

cur_dir=`pwd`
cd ..
SPEC_LITE=`pwd`
cd $cur_dir
echo "SPEC_LITE="$SPEC_LITE
for case in $cases; do
    mkdir -p $SPEC_LITE/$case/src
    echo "Ready to copy $SPEC_BM/$case/src into $SPEC_LITE/$case"
    cp -r $SPEC_BM/$case/src $SPEC_LITE/$case
done
