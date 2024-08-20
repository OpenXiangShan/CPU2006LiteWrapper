#$(error should handle .mod files)
NAME = 459.GemsFDTD
SRCS = $(addprefix src/, errorcheck.f90 parameter.f90 globalvar.f90 excite.f90 \
	 fourier_transf.f90 huygens.F90 posvector.f90 NFT.F90 readline.f90 \
	 PEC.f90 UPML.F90 calcflops.f90 progress.f90 update.F90 leapfrog.f90 \
	 readdata.f90 GemsFDTD.f90 timerRoutine.f90)
LD_FORTRAN = 1
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/test/output/sphere_td.nft)

train-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/train/output/sphere_td.nft)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/ref/output/sphere_td.nft)
