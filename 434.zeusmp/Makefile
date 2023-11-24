NAME = zeusmp
SRCS = $(shell find ./src -name "*.[f|F]")
LD_FORTRAN = 1
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 0.001  --reltol 0.001, run/tsl000aa, data/test/output/tsl000aa)

train-cmp:
	$(call SPECDIFF, --abstol 0.001  --reltol 0.001, run/tsl000aa, data/train/output/tsl000aa)

ref-cmp:
	$(call SPECDIFF, --abstol 0.001  --reltol 0.001, run/tsl000aa, data/ref/output/tsl000aa)
