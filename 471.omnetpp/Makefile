NAME = omnetpp
SRCS = $(shell find ./src -name "*.cc")
CFLAGS = -I./src -I./src/omnet_include -I./src/libs/envir
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, run/omnetpp.log, data/test/output/omnetpp.log)
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, run/omnetpp.sca, data/test/output/omnetpp.sca)

train-cmp:
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, run/omnetpp.log, data/train/output/omnetpp.log)
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, run/omnetpp.sca, data/train/output/omnetpp.sca)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, run/omnetpp.log, data/ref/output/omnetpp.log)
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, run/omnetpp.sca, data/ref/output/omnetpp.sca)
