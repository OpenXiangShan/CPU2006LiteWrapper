RUN_SH=`realpath $1`
WORK_DIR=`dirname $RUN_SH`
FULLNAME=`basename $WORK_DIR`
NAME=`echo $FULLNAME | sed -e 's/....//'`
SIZE=`echo $1 | sed -e 's/.*run-\(.*\)\.sh$/\1/'`
LOADER=$2

echo "Parparing data..."
rm -rf $WORK_DIR/run
mkdir -p $WORK_DIR/run
if [ -d $WORK_DIR/data/all/input ];   then cp -r $WORK_DIR/data/all/input/*   $WORK_DIR/run/; fi
if [ -d $WORK_DIR/data/$SIZE/input ]; then cp -r $WORK_DIR/data/$SIZE/input/* $WORK_DIR/run/; fi

if [ -f $WORK_DIR/extra-data/$SIZE.sh ]; then
  echo "Parparing extra data..."
  sh $WORK_DIR/extra-data/$SIZE.sh
fi

cd $WORK_DIR/run
TIME_LOG=$WORK_DIR/run/`basename $1`.timelog
export TIME='%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k\n%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps\n%e # elapsed in second'
date | tee $TIME_LOG
echo "@@@@@ Running $FULLNAME [$SIZE]..." | tee -a $TIME_LOG

# When host and target architecture are different, use qemu
# to run the target binary.
if [ "$ARCH" != `uname -m` ]; then
  if [ -z "$LOADER" ]; then
    LOADER="qemu-$ARCH"
  fi
fi
APP="/usr/bin/time -a -o $TIME_LOG $LOADER $WORK_DIR/build/$FULLNAME" sh $RUN_SH
cat $TIME_LOG
