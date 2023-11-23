NAME = hmmer
SRCS = $(shell find ./src -name "*.c")
LIBS = -lm
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.002 --skiptol 10, run/bombesin.out, data/test/output/bombesin.out)

train-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.002 --skiptol 10, run/leng100.out, data/train/output/leng100.out)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.002 --skiptol 10, run/nph3.out, data/ref/output/nph3.out)
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.002 --skiptol 10, run/retro.out, data/ref/output/retro.out)
