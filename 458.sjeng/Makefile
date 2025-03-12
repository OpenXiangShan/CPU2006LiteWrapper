NAME = 458.sjeng
SRCS = $(addprefix src/,attacks.c book.c crazy.c draw.c ecache.c epd.c eval.c leval.c \
	 moves.c neval.c partner.c proof.c rcfile.c search.c see.c seval.c \
	 sjeng.c ttable.c utils.c)
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	for f in test; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/test/output/$$f.out) \
	done; \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	for f in train; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/train/output/$$f.out) \
	done; \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	for f in ref; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/ref/output/$$f.out) \
	done; \
	$(call check_all_result)
include Makefile.deps
