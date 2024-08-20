NAME = 401.bzip2
SRCS = $(shell find ./src -name "*.c")
include ../Makefile.apps

test-cmp:
	@for f in dryer.jpg input.program; do \
		$(DIFF) run/$$f.out data/test/output/$$f.out; \
	done

train-cmp:
	@for f in byoudoin.jpg input.combined input.program; do \
		$(DIFF) run/$$f.out data/train/output/$$f.out; \
	done

ref-cmp:
	@for f in chicken.jpg input.combined input.program input.source liberty.jpg text.html; do \
		$(DIFF) run/$$f.out data/ref/output/$$f.out; \
	done
