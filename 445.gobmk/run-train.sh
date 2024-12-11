for f in arb arend arion atari_atari blunder buzco nicklas2 nicklas4; do \
  ${APP}${TAG} --quiet --mode gtp < $f.tst > $f.out;
done
