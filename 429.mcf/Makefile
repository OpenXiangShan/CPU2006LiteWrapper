NAME = 429.mcf
SRCS = $(shell find ./src -name "*.c")
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
