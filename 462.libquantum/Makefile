NAME = 462.libquantum
SRCS = $(addprefix src/, classic.c complex.c decoherence.c expn.c gates.c matrix.c \
	 measure.c oaddn.c objcode.c omuln.c qec.c qft.c qureg.c shor.c version.c \
	 specrand.c)
CFLAGS += -DSPEC_CPU_LINUX
LIBS = -lm
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --obiwan, $(RUN_DIR)/test.out, data/test/output/test.out),test.out) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --obiwan, $(RUN_DIR)/train.out, data/train/output/train.out),train.out) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --obiwan, $(RUN_DIR)/ref.out, data/ref/output/ref.out),ref.out) \
	$(call check_all_result)
include Makefile.deps
