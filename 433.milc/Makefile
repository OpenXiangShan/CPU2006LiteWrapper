NAME = 433.milc
SRCS = $(shell find ./src -name "*.c")
CFLAGS += -I./src -DFN -DFAST -DCONGRAD_TMP_VECTORS -DDSLASH_TMP_LINKS
LIBS += -lm
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 2e-07 --reltol 0.0001, run/su3imp.out, data/test/output/su3imp.out)

train-cmp:
	$(call SPECDIFF, --abstol 2e-07 --reltol 0.0001, run/su3imp.out, data/train/output/su3imp.out)

ref-cmp:
	$(call SPECDIFF, --abstol 2e-07 --reltol 0.0001, run/su3imp.out, data/ref/output/su3imp.out)
