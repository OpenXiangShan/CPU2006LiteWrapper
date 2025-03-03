NAME = 437.leslie3d
SRCS = src/tml.f
LD_FORTRAN = 1
include ../Makefile.apps
include ../Makefile.run

test-cmp: run
	$(call SPECDIFF, --floatcompare, $(RUN_DIR)/leslie3d.out, data/test/output/leslie3d.out)

train-cmp: run
	$(call SPECDIFF, --floatcompare, $(RUN_DIR)/leslie3d.out, data/train/output/leslie3d.out)

ref-cmp: run
	$(call SPECDIFF, --floatcompare, $(RUN_DIR)/leslie3d.out, data/ref/output/leslie3d.out)
include Makefile.deps
