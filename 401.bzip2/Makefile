NAME = 401.bzip2
SRCS = $(addprefix src/, spec.c blocksort.c bzip2.c bzlib.c compress.c crctable.c \
decompress.c huffman.c randtable.c)

include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@for f in dryer.jpg input.program; do \
		$(DIFF) $(RUN_DIR)/$$f.out data/test/output/$$f.out; \
	done

train-cmp:
	@for f in byoudoin.jpg input.combined input.program; do \
		$(DIFF) $(RUN_DIR)/$$f.out data/train/output/$$f.out; \
	done

ref-cmp:
	@for f in chicken.jpg input.combined input.program input.source liberty.jpg text.html; do \
		$(DIFF) $(RUN_DIR)/$$f.out data/ref/output/$$f.out; \
	done
include Makefile.deps
