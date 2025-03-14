for f in capture connect connect_rot connection connection_rot cutstone dniwog; do
  ${APP} --quiet --mode gtp < $f.tst > $f.out;
done
