NAME = 456.hmmer
SRCS = $(addprefix src/, alphabet.c core_algorithms.c debug.c display.c emit.c emulation.c \
	 fast_algorithms.c histogram.c hmmio.c hmmcalibrate.c hmmsearch.c \
	 mathsupport.c masks.c misc.c modelmakers.c plan7.c plan9.c postprob.c \
	 prior.c tophits.c trace.c ucbqsort.c a2m.c aligneval.c alignio.c \
	 clustal.c cluster.c dayhoff.c eps.c file.c getopt.c gki.c gsi.c \
	 hsregex.c iupac.c msa.c msf.c phylip.c revcomp.c rk.c selex.c \
	 seqencode.c shuffle.c sqerror.c sqio.c squidcore.c sre_ctype.c \
	 sre_math.c sre_random.c sre_string.c ssi.c stack.c stockholm.c \
	 translate.c types.c vectorops.c weight.c)
LIBS = -lm
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.002 --skiptol 10, run/bombesin.out, data/test/output/bombesin.out)

train-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.002 --skiptol 10, run/leng100.out, data/train/output/leng100.out)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.002 --skiptol 10, run/nph3.out, data/ref/output/nph3.out)
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.002 --skiptol 10, run/retro.out, data/ref/output/retro.out)
