NAME = 437.leslie3d
SRCS = src/tml.f
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --floatcompare, run/leslie3d.out, data/test/output/leslie3d.out)

train-cmp:
	$(call SPECDIFF, --floatcompare, run/leslie3d.out, data/train/output/leslie3d.out)

ref-cmp:
	$(call SPECDIFF, --floatcompare, run/leslie3d.out, data/ref/output/leslie3d.out)
include Makefile.deps
