NAME = 437.leslie3d
SRCS = src/tml.f
LD_FORTRAN = 1
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --floatcompare, $(RUN_DIR)/leslie3d.out, data/test/output/leslie3d.out),leslie3d.out) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --floatcompare, $(RUN_DIR)/leslie3d.out, data/train/output/leslie3d.out),leslie3d.out) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --floatcompare, $(RUN_DIR)/leslie3d.out, data/ref/output/leslie3d.out),leslie3d.out) \
	$(call check_all_result)
include Makefile.deps
