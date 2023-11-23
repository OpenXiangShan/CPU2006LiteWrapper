NAME = h264ref
SRCS = $(shell find ./src -name "*.c")
CFLAGS = -fsigned-char
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
