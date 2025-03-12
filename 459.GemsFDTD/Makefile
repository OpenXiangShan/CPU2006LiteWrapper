#$(error should handle .mod files)
NAME = 459.GemsFDTD
SRCS = $(addprefix src/, errorcheck.f90 parameter.f90 globalvar.f90 excite.f90 \
	 fourier_transf.f90 huygens.F90 posvector.f90 NFT.F90 readline.f90 \
	 PEC.f90 UPML.F90 calcflops.f90 progress.f90 update.F90 leapfrog.f90 \
	 readdata.f90 GemsFDTD.f90 timerRoutine.f90)
LD_FORTRAN = 1
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, $(RUN_DIR)/sphere_td.nft, data/test/output/sphere_td.nft),sphere_td.nft) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, $(RUN_DIR)/sphere_td.nft, data/train/output/sphere_td.nft),sphere_td.nft) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, $(RUN_DIR)/sphere_td.nft, data/ref/output/sphere_td.nft),sphere_td.nft) \
	$(call check_all_result)
include Makefile.deps
