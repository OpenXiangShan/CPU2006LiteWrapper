#$(error should handle .mod files)
NAME = 459.GemsFDTD
SRCS = src/errorcheck.f90 src/parameter.f90 src/globalvar.f90 src/excite.f90 src/fourier_transf.f90 src/huygens.F90 src/posvector.f90 src/NFT.F90 src/readline.f90 src/PEC.f90 src/UPML.F90 src/UPML.F90 src/calcflops.f90 src/progress.f90 src/update.F90 src/update.F90 src/leapfrog.f90 src/readdata.f90 src/GemsFDTD.f90 src/timerRoutine.f90
LD_FORTRAN = 1
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/test/output/sphere_td.nft)

train-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/train/output/sphere_td.nft)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/ref/output/sphere_td.nft)
