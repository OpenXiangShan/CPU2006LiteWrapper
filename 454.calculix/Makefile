NAME = calculix
SRCS = $(shell find ./src -name "*.c") $(shell find ./src -name "*.f" | grep -v gauss.f)
FFLAGS += -I./src/SPOOLES
CFLAGS += -I./src/SPOOLES
LD_FORTRAN = 1
LIBS += -lm
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, run/SPECtestformatmodifier_z.txt, data/test/output/SPECtestformatmodifier_z.txt)
	$(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, run/beampic.dat, data/test/output/beampic.dat)

train-cmp:
	$(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, run/SPECtestformatmodifier_z.txt, data/train/output/SPECtestformatmodifier_z.txt)
	$(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, run/stairs.dat, data/train/output/stairs.dat)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, run/SPECtestformatmodifier_z.txt, data/ref/output/SPECtestformatmodifier_z.txt)
	$(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, run/hyperviscoplastic.dat, data/ref/output/hyperviscoplastic.dat)
