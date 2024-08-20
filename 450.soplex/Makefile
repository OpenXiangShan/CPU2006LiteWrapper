NAME = 450.soplex
SRCS = $(addprefix src/, changesoplex.cc didxset.cc dsvector.cc dvector.cc enter.cc \
	 example.cc factor.cc forest.cc idxset.cc leave.cc lpcolset.cc lprow.cc \
	 lprowset.cc message.cc mpsinput.cc nameset.cc slufactor.cc solve.cc \
	 soplex.cc spxaggregatesm.cc spxbasis.cc spxbounds.cc spxchangebasis.cc \
	 spxdefaultpr.cc spxdefaultrt.cc spxdefines.cc spxdesc.cc spxdevexpr.cc \
	 spxequilisc.cc spxfastrt.cc spxgeneralsm.cc spxharrisrt.cc \
	 spxhybridpr.cc spxid.cc spxio.cc spxlp.cc spxlpfread.cc spxmpsread.cc \
	 spxmpswrite.cc spxparmultpr.cc spxquality.cc spxredundantsm.cc \
	 spxrem1sm.cc spxscaler.cc spxshift.cc spxsolve.cc spxsolver.cc \
	 spxstarter.cc spxsteeppr.cc spxsumst.cc spxvecs.cc spxvectorst.cc \
	 spxweightpr.cc spxweightst.cc ssvector.cc svector.cc svset.cc timer.cc \
	 unitvector.cc update.cc updatevector.cc vector.cc vsolve.cc)
CFLAGS += -std=c++03
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001 --obiwan, run/test.out, data/test/output/test.out)
	$(call SPECDIFF, --abstol 20  --reltol 10 --obiwan, run/test.stderr, data/test/output/test.stderr)

train-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 20 --obiwan, run/pds-20.mps.out, data/train/output/pds-20.mps.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, run/pds-20.mps.stderr, data/train/output/pds-20.mps.stderr)
	$(call SPECDIFF, --abstol 1e-05  --reltol 20 --obiwan, run/train.out, data/train/output/train.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, run/train.stderr, data/train/output/train.stderr)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.02 --obiwan, run/pds-50.mps.out, data/ref/output/pds-50.mps.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, run/pds-50.mps.stderr, data/ref/output/pds-50.mps.stderr)
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.02 --obiwan, run/ref.out, data/ref/output/ref.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, run/ref.stderr, data/ref/output/ref.stderr)
include Makefile.deps
