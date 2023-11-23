NAME = sphinx3
SRCS = $(shell find ./src -name "*.c")
CFLAGS = -I. -DHAVE_CONFIG_H -Ilibutil -fsigned-char
LIBS = -lm
include ../Makefile.apps

### Override rule (compile): a single `.c` -> `.o` (gcc)
$(DST_DIR)/%.o: %.c
	@mkdir -p $(dir $@) && echo + CC $<
	cd $(dir $<) && $(CC) $(CFLAGS) -c -o $(abspath $@) $(notdir $<)

test-cmp:
	$(call SPECDIFF, --reltol 0.001  --floatcompare, run/an4.log, data/test/output/an4.log)
	$(call SPECDIFF, --reltol 0.0004 --floatcompare, run/considered.out, data/test/output/considered.out)
	$(call SPECDIFF, --reltol 1e-06  --floatcompare, run/total_considered.out, data/test/output/total_considered.out)

train-cmp:
	$(call SPECDIFF, --reltol 0.001  --floatcompare, run/an4.log, data/train/output/an4.log)
	$(call SPECDIFF, --reltol 0.0004 --floatcompare, run/considered.out, data/train/output/considered.out)
	$(call SPECDIFF, --reltol 1e-06  --floatcompare, run/total_considered.out, data/train/output/total_considered.out)

ref-cmp:
	$(call SPECDIFF, --reltol 0.001  --floatcompare, run/an4.log, data/ref/output/an4.log)
	$(call SPECDIFF, --reltol 0.0004 --floatcompare, run/considered.out, data/ref/output/considered.out)
	$(call SPECDIFF, --reltol 1e-06  --floatcompare, run/total_considered.out, data/ref/output/total_considered.out)
