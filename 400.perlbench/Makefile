NAME = perlbench
SRCS = $(shell find ./src -name "*.c" | grep -vE "win32|hparser|parser-util")
CFLAGS += -DPERL_CORE -std=gnu89
ifeq ($(ARCH),i386)
CFLAGS  += -DSPEC_CPU_LINUX_IA32
LDFLAGS += -DSPEC_CPU_LINUX_IA32
else
CFLAGS  += -DSPEC_CPU_LINUX_X64
LDFLAGS += -DSPEC_CPU_LINUX_X64
endif
LIBS += -lm
include ../Makefile.apps

test-cmp:
	@for f in append.out args.out arith.out array.out attrs.out auto.out base_cond.out base_pat.out base_term.out bless.out bop.out bproto.out chars.out chop.out cmdopt.out cmp.out comp_term.out concat.out context.out decl.out defins.out delete.out die.out do.out each.out eval.out exists_sub.out exp.out fh.out grep.out gv.out hashwarn.out if.out inc.out index.out int.out join.out length.out lex.out list.out loopctl.out lop.out makerand.out method.out my.out nothr5005.out oct.out op_cond.out op_pat.out ord.out override.out pack.out package.out pos.out push.out quotemeta.out range.out recurse.out redef.out ref.out regexp.out regexp_noamp.out regmesg.out repeat.out reverse.out rs.out sleep.out sort.out splice.out study.out sub_lval.out subst.out subst_amp.out subst_wamp.out tr.out undef.out unshift.out vec.out wantarray.out; do \
		$(DIFF) run/$$f data/test/output/$$f; \
	done

train-cmp:
	@for f in diffmail.2.550.15.24.23.100.out perfect.b.3.out scrabbl.out splitmail.535.13.25.24.1091.out suns.out validate; do \
		$(DIFF) run/$$f data/train/output/$$f; \
	done

ref-cmp:
	@for f in checkspam.2500.5.25.11.150.1.1.1.1.out diffmail.4.800.10.17.19.300.out splitmail.1600.12.26.16.4500.out; do \
		$(DIFF) run/$$f data/ref/output/$$f; \
	done
