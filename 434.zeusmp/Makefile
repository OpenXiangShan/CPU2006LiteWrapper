NAME = zeusmp
SRCS = $(shell find ./src -name "*.f")
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 0.001  --reltol 0.001, run/tsl000aa, data/test/output/tsl000aa)

train-cmp:
	$(call SPECDIFF, --abstol 0.001  --reltol 0.001, run/tsl000aa, data/train/output/tsl000aa)

ref-cmp:
	$(call SPECDIFF, --abstol 0.001  --reltol 0.001, run/tsl000aa, data/ref/output/tsl000aa)
