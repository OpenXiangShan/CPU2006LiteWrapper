NAME = 473.astar
SRCS = $(shell find ./src -name "*.cpp")
CXXFLAGS += -DSPEC_CPU_LITTLE_ENDIAN
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --reltol 0.001, run/lake.out, data/test/output/lake.out)

train-cmp:
	$(call SPECDIFF, --reltol 0.001, run/BigLakes1024.out, data/train/output/BigLakes1024.out)
	$(call SPECDIFF, --reltol 0.001, run/rivers1.out, data/train/output/rivers1.out)

ref-cmp:
	$(call SPECDIFF, --reltol 0.001, run/BigLakes2048.out, data/ref/output/BigLakes2048.out)
	$(call SPECDIFF, --reltol 0.001, run/rivers.out, data/ref/output/rivers.out)
