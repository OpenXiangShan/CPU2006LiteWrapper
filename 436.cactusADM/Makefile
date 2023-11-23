NAME = cactusADM
SRCS = $(shell find ./src -name "*.c") $(shell find ./src -name "*.f")
CFLAGS += -I./src/include -DCCODE
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/test/output/benchADM.out)

train-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/train/output/benchADM.out)

ref-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/ref/output/benchADM.out)
