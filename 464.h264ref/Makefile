NAME = 464.h264ref
SRCS = $(addprefix src/, annexb.c biariencode.c block.c cabac.c configfile.c context_ini.c \
	 decoder.c explicit_gop.c fast_me.c filehandle.c fmo.c header.c image.c \
	 intrarefresh.c leaky_bucket.c lencod.c loopFilter.c macroblock.c \
	 mb_access.c mbuffer.c memalloc.c mv-search.c nal.c nalu.c nalucommon.c \
	 output.c parset.c parsetcommon.c q_matrix.c q_offsets.c ratectl.c \
	 rdopt.c rdopt_coding_state.c rdpicdecision.c refbuf.c rtp.c sei.c \
	 slice.c transform8x8.c vlc.c weighted_prediction.c specrand.c)
CFLAGS += -fsigned-char -std=c11
LIBS = -lm
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --cw --floatcompare, $(RUN_DIR)/foreman_test_baseline_encodelog.out, data/test/output/foreman_test_baseline_encodelog.out),foreman_test_baseline_encodelog.out) \
	$(call check_single_result, $(call SPECDIFF, --binary --cw --floatcompare, $(RUN_DIR)/foreman_test_baseline_leakybucketparam.cfg, data/test/output/foreman_test_baseline_leakybucketparam.cfg),foreman_test_baseline_leakybucketparam.cfg) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --cw --floatcompare, $(RUN_DIR)/foreman_train_baseline_encodelog.out, data/train/output/foreman_train_baseline_encodelog.out),foreman_train_baseline_encodelog.out) \
	$(call check_single_result, $(call SPECDIFF, --binary --cw --floatcompare, $(RUN_DIR)/foreman_train_baseline_leakybucketparam.cfg, data/train/output/foreman_train_baseline_leakybucketparam.cfg),foreman_train_baseline_leakybucketparam.cfg) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --cw --floatcompare, $(RUN_DIR)/foreman_ref_baseline_encodelog.out, data/ref/output/foreman_ref_baseline_encodelog.out),foreman_ref_baseline_encodelog.out) \
	$(call check_single_result, $(call SPECDIFF, --binary --cw --floatcompare, $(RUN_DIR)/foreman_ref_baseline_leakybucketparam.cfg, data/ref/output/foreman_ref_baseline_leakybucketparam.cfg),foreman_ref_baseline_leakybucketparam.cfg) \
	$(call check_single_result, $(call SPECDIFF, --cw --floatcompare, $(RUN_DIR)/foreman_ref_main_encodelog.out, data/ref/output/foreman_ref_main_encodelog.out),foreman_ref_main_encodelog.out) \
	$(call check_single_result, $(call SPECDIFF, --binary --cw --floatcompare, $(RUN_DIR)/foreman_ref_main_leakybucketparam.cfg, data/ref/output/foreman_ref_main_leakybucketparam.cfg),foreman_ref_main_leakybucketparam.cfg) \
	$(call check_single_result, $(call SPECDIFF, --cw --floatcompare, $(RUN_DIR)/sss_main_encodelog.out, data/ref/output/sss_main_encodelog.out),sss_main_encodelog.out) \
	$(call check_single_result, $(call SPECDIFF, --binary --cw --floatcompare, $(RUN_DIR)/sss_main_leakybucketparam.cfg, data/ref/output/sss_main_leakybucketparam.cfg),sss_main_leakybucketparam.cfg) \
	$(call check_all_result)
include Makefile.deps
