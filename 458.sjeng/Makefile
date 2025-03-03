NAME = 458.sjeng
SRCS = $(addprefix src/,attacks.c book.c crazy.c draw.c ecache.c epd.c eval.c leval.c \
	 moves.c neval.c partner.c proof.c rcfile.c search.c see.c seval.c \
	 sjeng.c ttable.c utils.c)
include ../Makefile.apps
include ../Makefile.run

test-cmp: run
	$(DIFF) $(RUN_DIR)/test.out data/test/output/test.out

train-cmp: run
	$(DIFF) $(RUN_DIR)/train.out data/train/output/train.out

ref-cmp: run
	$(DIFF) $(RUN_DIR)/ref.out data/ref/output/ref.out
include Makefile.deps
