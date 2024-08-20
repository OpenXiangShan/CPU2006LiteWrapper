NAME = 453.povray
SRCS = $(shell find ./src -name "*.cpp")
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 0  --reltol 0.0002, run/SPEC-benchmark.log, data/test/output/SPEC-benchmark.log)
	$(call SPECDIFF, --abstol 0  --reltol 0.0002  --skiptol 50 --binary, run/SPEC-benchmark.tga, data/test/output/SPEC-benchmark.tga)

train-cmp:
	$(call SPECDIFF, --abstol 0  --reltol 5e-05, run/SPEC-benchmark.log, data/train/output/SPEC-benchmark.log)
	$(call SPECDIFF, --abstol 0  --reltol 5e-05  --skiptol 50 --binary, run/SPEC-benchmark.tga, data/train/output/SPEC-benchmark.tga)

ref-cmp:
	$(call SPECDIFF, --abstol 0  --reltol 5e-05, run/SPEC-benchmark.log, data/ref/output/SPEC-benchmark.log)
	$(call SPECDIFF, --abstol 0  --reltol 5e-05  --skiptol 50 --binary, run/SPEC-benchmark.tga, data/ref/output/SPEC-benchmark.tga)
