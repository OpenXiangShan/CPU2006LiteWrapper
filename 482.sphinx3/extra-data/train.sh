cp extra-data/ctlfile-train run/ctlfile
for f in an406-fcaw-b an407-fcaw-b an408-fcaw-b an409-fcaw-b an410-fcaw-b; do
  cp run/$f.le.raw run/$f.raw
done
