NAME = 444.namd
SRCS = $(addprefix src/, Compute.C ComputeList.C ComputeNonbondedUtil.C LJTable.C \
Molecule.C Patch.C PatchList.C ResultSet.C SimParameters.C erf.C \
spec_namd.C)
LD_CXX = 1
CFLAGS += -std=c++98
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --abstol 1e-05, $(RUN_DIR)/namd.out, data/test/output/namd.out),namd.out) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --abstol 1e-05, $(RUN_DIR)/namd.out, data/train/output/namd.out),namd.out) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --abstol 1e-05, $(RUN_DIR)/namd.out, data/ref/output/namd.out),namd.out) \
	$(call check_all_result)
include Makefile.deps
