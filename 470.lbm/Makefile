NAME = 470.lbm
SRCS = $(addprefix src/, lbm.c main.c)
LIBS = -lm
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-07, $(RUN_DIR)/lbm.out, data/test/output/lbm.out),lbm.out) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-07, $(RUN_DIR)/lbm.out, data/train/output/lbm.out), lbm.out) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-07, $(RUN_DIR)/lbm.out, data/ref/output/lbm.out), lbm.out) \
	$(call check_all_result)
include Makefile.deps
