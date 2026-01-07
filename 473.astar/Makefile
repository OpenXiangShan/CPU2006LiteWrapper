NAME = 473.astar
SRCS = $(addprefix src/, CreateWay_.cpp Places_.cpp RegBounds_.cpp RegMng_.cpp Way2_.cpp \
	 WayInit_.cpp Library.cpp Random.cpp Region_.cpp RegWay_.cpp Way_.cpp)
CFLAGS += -DSPEC_CPU_LITTLE_ENDIAN -std=c++98
LD_CXX = 1
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.001, $(RUN_DIR)/lake.out, data/test/output/lake.out), lake.out) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.001, $(RUN_DIR)/BigLakes1024.out, data/train/output/BigLakes1024.out),BigLakes1024.out) \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.001, $(RUN_DIR)/rivers1.out, data/train/output/rivers1.out),rivers1.out) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.001, $(RUN_DIR)/BigLakes2048.out, data/ref/output/BigLakes2048.out),BigLakes2048.out) \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.001, $(RUN_DIR)/rivers.out, data/ref/output/rivers.out),rivers.out) \
	$(call check_all_result)
include Makefile.deps
