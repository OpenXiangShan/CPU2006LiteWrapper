cp extra-data/ctlfile-train $1/ctlfile
for f in an406-fcaw-b an407-fcaw-b an408-fcaw-b an409-fcaw-b an410-fcaw-b; do
  cp $1/$f.le.raw $1/$f.raw
done
