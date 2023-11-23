for f in 13x13 nngs score2 trevorc trevord; do
  $APP --quiet --mode gtp < $f.tst > $f.out;
done
