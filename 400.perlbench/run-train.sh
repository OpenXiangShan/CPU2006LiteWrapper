${APP} -I./lib diffmail.pl 2 550 15 24 23 100 > diffmail.2.550.15.24.23.100.out 2> diffmail.2.550.15.24.23.100.err
${APP} -I./lib perfect.pl b 3 > perfect.b.3.out 2> perfect.b.3.err
${APP} -I./lib splitmail.pl 535 13 25 24 1091 > splitmail.535.13.25.24.1091.out 2> splitmail.535.13.25.24.1091.err
${APP} -I. -I./lib scrabbl.pl < scrabbl.in > scrabbl.out 2> scrabbl.err
${APP} -I. -I./lib suns.pl > suns.out 2> suns.err
