NAME = 410.bwaves
SRCS = $(addprefix src/, block_solver.f flow_lam.f flux_lam.f jacobian_lam.f shell_lam.f)

LD_FORTRAN=1
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	$(call SPECDIFF, --abstol 1e-16, $(RUN_DIR)/bwaves.out,  data/test/output/bwaves.out)
	$(call SPECDIFF, --reltol 0.015, $(RUN_DIR)/bwaves2.out, data/test/output/bwaves2.out)
	$(call SPECDIFF, --abstol 1e-06, $(RUN_DIR)/bwaves3.out, data/test/output/bwaves3.out)

train-cmp:
	$(call SPECDIFF, --abstol 1e-16, $(RUN_DIR)/bwaves.out,  data/train/output/bwaves.out)
	$(call SPECDIFF, --reltol 0.015, $(RUN_DIR)/bwaves2.out, data/train/output/bwaves2.out)
	$(call SPECDIFF, --abstol 1e-06, $(RUN_DIR)/bwaves3.out, data/train/output/bwaves3.out)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-16, $(RUN_DIR)/bwaves.out,  data/ref/output/bwaves.out)
	$(call SPECDIFF, --reltol 0.015, $(RUN_DIR)/bwaves2.out, data/ref/output/bwaves2.out)
	$(call SPECDIFF, --abstol 1e-06, $(RUN_DIR)/bwaves3.out, data/ref/output/bwaves3.out)
include Makefile.deps
