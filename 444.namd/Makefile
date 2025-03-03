NAME = 444.namd
SRCS = $(addprefix src/, Compute.C ComputeList.C ComputeNonbondedUtil.C LJTable.C \
Molecule.C Patch.C PatchList.C ResultSet.C SimParameters.C erf.C \
spec_namd.C)
LD_CXX = 1
include ../Makefile.apps
include ../Makefile.run

test-cmp: run
	$(call SPECDIFF, --abstol 1e-05, $(RUN_DIR)/namd.out, data/test/output/namd.out)

train-cmp: run
	$(call SPECDIFF, --abstol 1e-05, $(RUN_DIR)/namd.out, data/train/output/namd.out)

ref-cmp: run
	$(call SPECDIFF, --abstol 1e-05, $(RUN_DIR)/namd.out, data/ref/output/namd.out)
include Makefile.deps
