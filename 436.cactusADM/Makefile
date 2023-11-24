NAME = cactusADM
SRCS = $(shell find ./src -name "*.c") $(shell find ./src -name "*.[f|F]")
CFLAGS += -I./src/include -DCCODE
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/test/output/benchADM.out)

train-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/train/output/benchADM.out)

ref-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/ref/output/benchADM.out)
