NAME = 429.mcf
SRCS = $(addprefix src/, mcf.c mcfutil.c readmin.c implicit.c pstart.c output.c treeup.c \
	 pbla.c pflowup.c psimplex.c pbeampp.c)
CFLAGS += -DWANT_STDC_PROTO
LIBS += -lm
include ../Makefile.apps
include ../Makefile.run

test-cmp: run
	@for f in inp mcf; do \
		$(DIFF) $(RUN_DIR)/$$f.out data/test/output/$$f.out; \
	done

train-cmp: run
	@for f in inp mcf; do \
		$(DIFF) $(RUN_DIR)/$$f.out data/train/output/$$f.out; \
	done

ref-cmp: run
	@for f in inp mcf; do \
		$(DIFF) $(RUN_DIR)/$$f.out data/ref/output/$$f.out; \
	done
include Makefile.deps
