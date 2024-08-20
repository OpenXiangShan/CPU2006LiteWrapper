NAME = 447.dealII
SRCS = $(shell find ./src -name "*.cc")
CFLAGS += -I$(abspath ./src/include) -DBOOST_DISABLE_THREADS -Ddeal_II_dimension=3 -fpermissive -include cstring
ifneq ($(ARCH),riscv64)
CFLAGS += -mlong-double-64
endif
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	for i in 0 1 2 3 4 5 6 7 8; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/all/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/all/output/solution-$$i.gmv); \
	done
	$(call SPECDIFF, --abstol 1e-07, run/log, data/test/output/log)

train-cmp:
	for i in 0 1 2 3 4 5 6 7 8; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/all/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/all/output/solution-$$i.gmv); \
	done
	for i in 9 10; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/train/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/train/output/solution-$$i.gmv); \
	done
	$(call SPECDIFF, --abstol 1e-07, run/log, data/train/output/log)

ref-cmp:
	for i in 0 1 2 3 4 5 6 7 8; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/all/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/all/output/solution-$$i.gmv); \
	done
	for i in 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/ref/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/ref/output/solution-$$i.gmv); \
	done
	$(call SPECDIFF, --abstol 1e-07, run/log, data/ref/output/log)
