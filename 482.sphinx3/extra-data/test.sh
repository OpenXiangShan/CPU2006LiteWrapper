cp extra-data/ctlfile-test $1/ctlfile
for f in an406-fcaw-b an407-fcaw-b; do
  cp $1/$f.le.raw $1/$f.raw
done
