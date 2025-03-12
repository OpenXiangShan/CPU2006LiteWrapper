NAME = 429.mcf
SRCS = $(addprefix src/, mcf.c mcfutil.c readmin.c implicit.c pstart.c output.c treeup.c \
	 pbla.c pflowup.c psimplex.c pbeampp.c)
CFLAGS += -DWANT_STDC_PROTO
LIBS += -lm
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	for f in inp mcf; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/test/output/$$f.out) \
	done; \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	for f in inp mcf; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/train/output/$$f.out) \
	done; \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	for f in inp mcf; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f.out data/ref/output/$$f.out) \
	done; \
	$(call check_all_result)
include Makefile.deps
