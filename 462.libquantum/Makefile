NAME = 462.libquantum
SRCS = $(addprefix src/, classic.c complex.c decoherence.c expn.c gates.c matrix.c \
	 measure.c oaddn.c objcode.c omuln.c qec.c qft.c qureg.c shor.c version.c \
	 specrand.c)
CFLAGS += -DSPEC_CPU_LINUX
LIBS = -lm
include ../Makefile.apps
include ../Makefile.run

test-cmp: run
	$(call SPECDIFF, --obiwan, $(RUN_DIR)/test.out, data/test/output/test.out)

train-cmp: run
	$(call SPECDIFF, --obiwan, $(RUN_DIR)/train.out, data/train/output/train.out)

ref-cmp: run
	$(call SPECDIFF, --obiwan, $(RUN_DIR)/ref.out, data/ref/output/ref.out)
include Makefile.deps
