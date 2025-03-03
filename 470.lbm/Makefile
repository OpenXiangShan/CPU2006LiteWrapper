NAME = 470.lbm
SRCS = $(addprefix src/, lbm.c main.c)
LIBS = -lm
include ../Makefile.apps
include ../Makefile.run

test-cmp: run
	$(call SPECDIFF, --abstol 1e-07, $(RUN_DIR)/lbm.out, data/test/output/lbm.out)

train-cmp: run
	$(call SPECDIFF, --abstol 1e-07, $(RUN_DIR)/lbm.out, data/train/output/lbm.out)

ref-cmp: run
	$(call SPECDIFF, --abstol 1e-07, $(RUN_DIR)/lbm.out, data/ref/output/lbm.out)
include Makefile.deps
