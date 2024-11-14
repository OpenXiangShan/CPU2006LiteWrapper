for f in 166 200 c-typeck cp-decl expr expr2 g23 s04 scilab; do
  INPUT=$(find . -maxdepth 1 -type f -name "$f.i*" | sed 's|.*/||' | head -n 1)
  $APP "$INPUT" -o $f.s
done
