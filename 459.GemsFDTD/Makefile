#$(error should handle .mod files)
NAME = GemsFDTD
SRCS = $(shell find src -name "*.f90")
LD_FORTRAN = 1
include ../Makefile.apps

build/src/leapfrog.o: src/leapfrog.f90 $(addprefix build/src/, errorcheck.o parameter.o PEC.o calcflops.o globalvar.o progress.o huygens.fppized.o update.fppized.o UPML.fppized.o NFT.fppized.o)
build/src/readdata.o: src/readdata.f90 $(addprefix build/src/, parameter.o globalvar.o errorcheck.o excite.o PEC.o progress.o huygens.fppized.o UPML.fppized.o NFT.fppized.o)
build/src/excite.o: src/excite.f90 $(addprefix build/src/, parameter.o globalvar.o)
build/src/PEC.o: src/PEC.f90 $(addprefix build/src/, parameter.o errorcheck.o readline.o globalvar.o)
build/src/progress.o: src/progress.f90 $(addprefix build/src/, parameter.o globalvar.o)
build/src/calcflops.o: src/calcflops.f90 $(addprefix build/src/, globalvar.o parameter.o  huygens.fppized.o UPML.fppized.o NFT.fppized.o)
build/src/fourier_transf.o: src/fourier_transf.f90 build/src/parameter.o
build/src/GemsFDTD.o: src/GemsFDTD.f90 $(addprefix build/src/, parameter.o readdata.o leapfrog.o)
build/src/globalvar.o: src/globalvar.f90 build/src/parameter.o
build/src/posvector.o: src/posvector.f90 build/src/parameter.o
build/src/huygens.fppized.o: src/huygens.fppized.f90 $(addprefix build/src/, parameter.o globalvar.o excite.o errorcheck.o)
build/src/UPML.fppized.o: src/UPML.fppized.f90 $(addprefix build/src/, parameter.o globalvar.o errorcheck.o PEC.o)
build/src/NFT.fppized.o: src/NFT.fppized.f90 $(addprefix build/src/, parameter.o globalvar.o posvector.o fourier_transf.o errorcheck.o excite.o huygens.fppized.o)
build/src/update.fppized.o: src/update.fppized.f90 $(addprefix build/src/, parameter.o globalvar.o)

test-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/test/output/sphere_td.nft)

train-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/train/output/sphere_td.nft)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-10  --reltol 1e-09  --obiwan, run/sphere_td.nft, data/ref/output/sphere_td.nft)
