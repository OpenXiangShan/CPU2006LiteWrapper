NAME = 462.libquantum
SRCS = $(addprefix src/, classic.c complex.c decoherence.c expn.c gates.c matrix.c \
	 measure.c oaddn.c objcode.c omuln.c qec.c qft.c qureg.c shor.c version.c \
	 specrand.c)
CFLAGS += -DSPEC_CPU_LINUX
LIBS = -lm
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --obiwan, run/test.out, data/test/output/test.out)

train-cmp:
	$(call SPECDIFF, --obiwan, run/train.out, data/train/output/train.out)

ref-cmp:
	$(call SPECDIFF, --obiwan, run/ref.out, data/ref/output/ref.out)
