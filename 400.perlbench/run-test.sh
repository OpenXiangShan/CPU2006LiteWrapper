for f in attrs gv makerand pack redef ref regmesg test;
  do ${APP}${TAG} -I. -I./lib $f.pl > $f.out 2> $f.err;
done
