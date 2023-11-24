NAME = gamess
CFLAGS = -funconstrained-commons
FFLAGS_EXTRA = -std=legacy -funconstrained-commons -fno-strict-aliasing
LD_FORTRAN = 1
SRCS = $(shell find src -name "*.[f|F]")
SPECPPFLAGS = -DSPEC_CPU_NO_HOLLERITH -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64

include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/exam29.out, data/test/output/exam29.out)

train-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/h2ocu2+.energy.out, data/train/output/h2ocu2+.energy.out)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/cytosine.2.out, data/ref/output/cytosine.2.out)
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/h2ocu2+.gradient.out, data/ref/output/h2ocu2+.gradient.out)
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/triazolium.out, data/ref/output/triazolium.out)
