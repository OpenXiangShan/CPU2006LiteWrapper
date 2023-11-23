NAME = namd
SRCS = $(shell find ./src -name "*.C")
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-05, run/namd.out, data/test/output/namd.out)

train-cmp:
	$(call SPECDIFF, --abstol 1e-05, run/namd.out, data/train/output/namd.out)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-05, run/namd.out, data/ref/output/namd.out)
