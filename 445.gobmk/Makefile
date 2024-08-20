NAME = 445.gobmk
SRCS = $(shell find ./src -name "*.c")
CFLAGS += -DHAVE_CONFIG_H -I$(abspath ./src/include)
LIBS = -lm
include ../Makefile.apps

test-cmp:
	@for f in capture connect connect_rot connection connection_rot cutstone dniwog; do \
		$(DIFF) run/$$f.out data/test/output/$$f.out; \
	done

train-cmp:
	@for f in arb arend arion atari_atari blunder buzco nicklas2 nicklas4; do \
		$(DIFF) run/$$f.out data/train/output/$$f.out; \
	done

ref-cmp:
	@for f in 13x13 nngs score2 trevorc trevord; do \
		$(DIFF) run/$$f.out data/ref/output/$$f.out; \
	done
