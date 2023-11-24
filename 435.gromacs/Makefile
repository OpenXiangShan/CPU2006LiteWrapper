NAME = gromacs
SRCS = $(shell find ./src -name "*.c") $(shell find ./src -name "*.[f|F]")
CFLAGS += -I./src -DHAVE_CONFIG_H
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --reltol 0.0125, run/gromacs.out, data/test/output/gromacs.out)

train-cmp:
	$(call SPECDIFF, --reltol 0.0125, run/gromacs.out, data/train/output/gromacs.out)

ref-cmp:
	$(call SPECDIFF, --reltol 0.0125, run/gromacs.out, data/ref/output/gromacs.out)
