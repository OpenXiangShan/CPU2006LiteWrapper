NAME = libquantum
SRCS = $(shell find ./src -name "*.c")
CFLAGS += -DSPEC_CPU_LINUX
LIBS = -lm
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --obiwan, run/test.out, data/test/output/test.out)

train-cmp:
	$(call SPECDIFF, --obiwan, run/train.out, data/train/output/train.out)

ref-cmp:
	$(call SPECDIFF, --obiwan, run/ref.out, data/ref/output/ref.out)
