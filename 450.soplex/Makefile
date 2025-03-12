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
include ../Makefile.run

# Add this function to accommodate different versions of spec06 file suffixes
adapt_suffix = $(shell if test -f $(1)$(2); then echo $(1)$(2); elif test -f $(1)$(3); then echo $(1)$(3); elif test -f $(1)$(4); then echo $(1)$(4); elif test -f $(1)$(5); then echo $(1)$(5); fi)

test-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-05  --reltol 0.0001 --obiwan, $(RUN_DIR)/test.out, data/test/output/test.out),test.out) \
	$(call only_check, $(call SPECDIFF, --abstol 20  --reltol 10 --obiwan, \
		$(call adapt_suffix,$(RUN_DIR)/test,.mps.out,.mps.stderr,.mps.info,.out,.stderr), \
		$(call adapt_suffix,data/test/output/test,.mps.out,.mps.stderr,.mps.info,.out,.stderr)),test.x) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-05  --reltol 20 --obiwan, $(RUN_DIR)/pds-20.mps.out, data/train/output/pds-20.mps.out),pds-20.mps.out) \
	$(call only_check, $(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, \
		$(call adapt_suffix,$(RUN_DIR)/pds-20,.mps.out,.mps.stderr,.mps.info,.out,.stderr), \
		$(call adapt_suffix,data/train/output/pds-20,.mps.out,.mps.stderr,.mps.info,.out,.stderr)),pds-20.x) \
	$(call only_check, $(call SPECDIFF, --abstol 1e-05  --reltol 20 --obiwan, $(RUN_DIR)/train.out, data/train/output/train.out),train.out) \
	$(call only_check, $(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, \
		$(call adapt_suffix,$(RUN_DIR)/train,.mps.out,.mps.stderr,.mps.info,.out,.stderr), \
		$(call adapt_suffix,data/train/output/train,.mps.out,.mps.stderr,.mps.info,.out,.stderr)),train.x) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-05  --reltol 0.02 --obiwan, $(RUN_DIR)/pds-50.mps.out, data/ref/output/pds-50.mps.out),pds-50.mps.out) \
	$(call only_check, $(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, \
		$(call adapt_suffix,$(RUN_DIR)/pds-50,.mps.out,.mps.stderr,.mps.info,.out,.stderr), \
		$(call adapt_suffix,data/ref/output/pds-50,.mps.out,.mps.stderr,.mps.info,.out,.stderr)),pds-50.x) \
	$(call only_check, $(call SPECDIFF, --abstol 1e-05  --reltol 0.02 --obiwan, $(RUN_DIR)/ref.out, data/ref/output/ref.out),ref.out) \
	$(call only_check, $(call SPECDIFF, --abstol 20  --reltol 0.0001 --obiwan, \
		$(call adapt_suffix,$(RUN_DIR)/ref,.mps.out,.mps.stderr,.mps.info,.out,.stderr), \
		$(call adapt_suffix,data/ref/output/ref,.mps.out,.mps.stderr,.mps.info,.out,.stderr)),ref.x) \
	$(call check_all_result)
include Makefile.deps
