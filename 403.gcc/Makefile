NAME = 403.gcc
SRCS = $(shell find ./src -name "*.c")
CFLAGS += -I./src
include ../Makefile.apps

test-cmp:
	$(DIFF) run/cccp.s data/test/output/cccp.s

train-cmp:
	$(DIFF) run/integrate.s data/train/output/integrate.s

ref-cmp:
	@for f in 166 200 c-typeck cp-decl expr expr2 g23 s04 scilab; do \
		$(DIFF) run/$$f.s data/ref/output/$$f.s; \
	done
