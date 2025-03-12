NAME = 401.bzip2
SRCS = $(addprefix src/, spec.c blocksort.c bzip2.c bzlib.c compress.c crctable.c \
decompress.c huffman.c randtable.c)

include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	for f in dryer.jpg input.program; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/test/output/$$f.out) \
	done; \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	for f in byoudoin.jpg input.combined input.program; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/train/output/$$f.out) \
	done; \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	for f in chicken.jpg input.combined input.program input.source liberty.jpg text.html; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/ref/output/$$f.out) \
	done; \
	$(call check_all_result)
include Makefile.deps
