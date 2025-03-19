NAME = 482.sphinx3
SRCS = $(addprefix src/, spec_main_live_pretend.c parse_args_file.c live.c agc.c \
	 approx_cont_mgau.c ascr.c beam.c bio.c case.c ckd_alloc.c cmd_ln.c cmn.c \
	 cmn_prior.c cont_mgau.c dict.c dict2pid.c err.c feat.c fillpen.c glist.c \
	 gs.c hash.c heap.c hmm.c io.c kb.c kbcore.c lextree.c lm.c lmclass.c \
	 logs3.c mdef.c new_fe.c new_fe_sp.c profile.c specrand.c str2words.c \
	 subvq.c tmat.c unlimit.c utt.c vector.c vithist.c wid.c)
CFLAGS += -I. -DHAVE_CONFIG_H -Ilibutil -fsigned-char
LIBS = -lm
include ../Makefile.apps
include ../Makefile.run

### Override rule (compile): a single `.c` -> `.o` (gcc)
$(DST_DIR)/%.o: %.c
	@mkdir -p $(dir $@) && echo + CC $<
	cd $(dir $<) && $(CC) $(CFLAGS) -c -o $(abspath $@) $(notdir $<)

test-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.001  --floatcompare, $(RUN_DIR)/an4.log, data/test/output/an4.log), an4.log) \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.0004 --floatcompare, $(RUN_DIR)/considered.out, data/test/output/considered.out),considered.out) \
	$(call check_single_result, $(call SPECDIFF, --reltol 1e-06  --floatcompare, $(RUN_DIR)/total_considered.out, data/test/output/total_considered.out),total_considered.out) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.001  --floatcompare, $(RUN_DIR)/an4.log, data/train/output/an4.log),an4.log) \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.0004 --floatcompare, $(RUN_DIR)/considered.out, data/train/output/considered.out),considered.out) \
	$(call check_single_result, $(call SPECDIFF, --reltol 1e-06  --floatcompare, $(RUN_DIR)/total_considered.out, data/train/output/total_considered.out),total_considered.out) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.001  --floatcompare, $(RUN_DIR)/an4.log, data/ref/output/an4.log),an4.log) \
	$(call check_single_result, $(call SPECDIFF, --reltol 0.0004 --floatcompare, $(RUN_DIR)/considered.out, data/ref/output/considered.out),considered.out) \
	$(call check_single_result, $(call SPECDIFF, --reltol 1e-06  --floatcompare, $(RUN_DIR)/total_considered.out, data/ref/output/total_considered.out),total_considered.out) \
	$(call check_all_result)
include Makefile.deps
