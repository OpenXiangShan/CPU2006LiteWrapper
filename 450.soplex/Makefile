NAME = 450.soplex
SRCS = $(shell find ./src -name "*.cc")
CFLAGS += -std=c++03
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001 --obiwan, run/test.out, data/test/output/test.out)
	$(call SPECDIFF, --abstol 20  --reltol 10 --obiwan, run/test.stderr, data/test/output/test.stderr)

train-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 20 --obiwan, run/pds-20.mps.out, data/train/output/pds-20.mps.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, run/pds-20.mps.stderr, data/train/output/pds-20.mps.stderr)
	$(call SPECDIFF, --abstol 1e-05  --reltol 20 --obiwan, run/train.out, data/train/output/train.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, run/train.stderr, data/train/output/train.stderr)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.02 --obiwan, run/pds-50.mps.out, data/ref/output/pds-50.mps.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, run/pds-50.mps.stderr, data/ref/output/pds-50.mps.stderr)
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.02 --obiwan, run/ref.out, data/ref/output/ref.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, run/ref.stderr, data/ref/output/ref.stderr)
