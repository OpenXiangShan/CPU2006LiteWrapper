NAME = 429.mcf
SRCS = $(addprefix src/, mcf.c mcfutil.c readmin.c implicit.c pstart.c output.c treeup.c \
	 pbla.c pflowup.c psimplex.c pbeampp.c)
CFLAGS += -DWANT_STDC_PROTO
LIBS += -lm
include ../Makefile.apps

test-cmp:
	@for f in inp mcf; do \
		$(DIFF) run/$$f.out data/test/output/$$f.out; \
	done

train-cmp:
	@for f in inp mcf; do \
		$(DIFF) run/$$f.out data/train/output/$$f.out; \
	done

ref-cmp:
	@for f in inp mcf; do \
		$(DIFF) run/$$f.out data/ref/output/$$f.out; \
	done
