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

# Add this function to accommodate different versions of spec06 file suffixes
adapt_suffix = $(shell if test -f $(1)$(2); then echo $(1)$(2); elif test -f $(1)$(3); then echo $(1)$(3); fi)

test-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001 --obiwan, run/test.out, data/test/output/test.out)
	$(call SPECDIFF, --abstol 20  --reltol 10 --obiwan, \
		$(call adapt_suffix,run/test,.mps.info,.stderr), \
		$(call adapt_suffix,data/test/output/test,.mps.info,.stderr))

train-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 20 --obiwan, run/pds-20.mps.out, data/train/output/pds-20.mps.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, \
		$(call adapt_suffix,run/pds-20,.mps.info,.stderr), \
		$(call adapt_suffix,data/train/output/pds-20,.mps.info,.stderr))
	$(call SPECDIFF, --abstol 1e-05  --reltol 20 --obiwan, run/train.out, data/train/output/train.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, \
		$(call adapt_suffix,run/train,.mps.info,.stderr), \
		$(call adapt_suffix,data/train/output/train,.mps.info,.stderr))

ref-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.02 --obiwan, run/pds-50.mps.out, data/ref/output/pds-50.mps.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, \
		$(call adapt_suffix,run/pds-50,.mps.info,.stderr), \
		$(call adapt_suffix,data/ref/output/pds-50,.mps.info,.stderr))
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.02 --obiwan, run/ref.out, data/ref/output/ref.out)
	$(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, \
		$(call adapt_suffix,run/ref,.mps.info,.stderr), \
		$(call adapt_suffix,data/ref/output/ref,.mps.info,.stderr))
include Makefile.deps
