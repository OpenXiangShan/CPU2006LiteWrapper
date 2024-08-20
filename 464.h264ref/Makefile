NAME = 464.h264ref
SRCS = $(addprefix src/, annexb.c biariencode.c block.c cabac.c configfile.c context_ini.c \
	 decoder.c explicit_gop.c fast_me.c filehandle.c fmo.c header.c image.c \
	 intrarefresh.c leaky_bucket.c lencod.c loopFilter.c macroblock.c \
	 mb_access.c mbuffer.c memalloc.c mv-search.c nal.c nalu.c nalucommon.c \
	 output.c parset.c parsetcommon.c q_matrix.c q_offsets.c ratectl.c \
	 rdopt.c rdopt_coding_state.c rdpicdecision.c refbuf.c rtp.c sei.c \
	 slice.c transform8x8.c vlc.c weighted_prediction.c specrand.c)
CFLAGS += -fsigned-char
LIBS = -lm
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --cw --floatcompare, run/foreman_test_baseline_encodelog.out, data/test/output/foreman_test_baseline_encodelog.out)
	$(call SPECDIFF, --binary --cw --floatcompare, run/foreman_test_baseline_leakybucketparam.cfg, data/test/output/foreman_test_baseline_leakybucketparam.cfg)

train-cmp:
	$(call SPECDIFF, --cw --floatcompare, run/foreman_train_baseline_encodelog.out, data/train/output/foreman_train_baseline_encodelog.out)
	$(call SPECDIFF, --binary --cw --floatcompare, run/foreman_train_baseline_leakybucketparam.cfg, data/train/output/foreman_train_baseline_leakybucketparam.cfg)

ref-cmp:
	$(call SPECDIFF, --cw --floatcompare, run/foreman_ref_baseline_encodelog.out, data/ref/output/foreman_ref_baseline_encodelog.out)
	$(call SPECDIFF, --binary --cw --floatcompare, run/foreman_ref_baseline_leakybucketparam.cfg, data/ref/output/foreman_ref_baseline_leakybucketparam.cfg)
	$(call SPECDIFF, --cw --floatcompare, run/foreman_ref_main_encodelog.out, data/ref/output/foreman_ref_main_encodelog.out)
	$(call SPECDIFF, --binary --cw --floatcompare, run/foreman_ref_main_leakybucketparam.cfg, data/ref/output/foreman_ref_main_leakybucketparam.cfg)
	$(call SPECDIFF, --cw --floatcompare, run/sss_main_encodelog.out, data/ref/output/sss_main_encodelog.out)
	$(call SPECDIFF, --binary --cw --floatcompare, run/sss_main_leakybucketparam.cfg, data/ref/output/sss_main_leakybucketparam.cfg)
