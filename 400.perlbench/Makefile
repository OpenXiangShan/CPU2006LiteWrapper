NAME = 400.perlbench
SRCS = $(addprefix src/, av.c deb.c doio.c doop.c dump.c globals.c gv.c hv.c locale.c mg.c \
	 numeric.c op.c pad.c perl.c perlapi.c perlio.c perlmain.c perly.c pp.c \
	 pp_ctl.c pp_hot.c pp_pack.c pp_sort.c pp_sys.c regcomp.c regexec.c run.c \
	 scope.c sv.c taint.c toke.c universal.c utf8.c util.c xsutils.c Base64.c \
	 Cwd.c Dumper.c HiRes.c IO.c Peek.c attrs.c poll.c stdio.c DynaLoader.c \
	 MD5.c Storable.c Parser.c specrand.c Hostname.c Opcode.c)

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
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	for f in append.out args.out arith.out array.out attrs.out auto.out base_cond.out base_pat.out base_term.out bless.out bop.out bproto.out chars.out chop.out cmdopt.out cmp.out comp_term.out concat.out context.out decl.out defins.out delete.out die.out do.out each.out eval.out exists_sub.out exp.out fh.out grep.out gv.out hashwarn.out if.out inc.out index.out int.out join.out length.out lex.out list.out loopctl.out lop.out makerand.out method.out my.out nothr5005.out oct.out op_cond.out op_pat.out ord.out override.out pack.out package.out pos.out push.out quotemeta.out range.out recurse.out redef.out ref.out regexp.out regexp_noamp.out regmesg.out repeat.out reverse.out rs.out sleep.out sort.out splice.out study.out sub_lval.out subst.out subst_amp.out subst_wamp.out tr.out undef.out unshift.out vec.out wantarray.out; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f data/test/output/$$f) \
	done; \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	for f in diffmail.2.550.15.24.23.100.out perfect.b.3.out scrabbl.out splitmail.535.13.25.24.1091.out suns.out validate; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f data/train/output/$$f) \
	done; \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	for f in checkspam.2500.5.25.11.150.1.1.1.1.out diffmail.4.800.10.17.19.300.out splitmail.1600.12.26.16.4500.out; do \
	$(call check_single_result, $(DIFF) $(RUN_DIR)/$$f data/ref/output/$$f) \
	done; \
	$(call check_all_result)

include Makefile.deps
