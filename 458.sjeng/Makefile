NAME = 458.sjeng
SRCS = $(shell find ./src -name "*.c")
include ../Makefile.apps

test-cmp:
	$(DIFF) run/test.out data/test/output/test.out

train-cmp:
	$(DIFF) run/train.out data/train/output/train.out

ref-cmp:
	$(DIFF) run/ref.out data/ref/output/ref.out
