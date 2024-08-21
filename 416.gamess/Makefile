NAME = 416.gamess
CFLAGS += -funconstrained-commons
FFLAGS_EXTRA = -std=legacy -funconstrained-commons -fno-strict-aliasing
LD_FORTRAN = 1
SRCS = $(addprefix src/, aldeci.F algnci.F basecp.F basext.f bashuz.f bashz2.f basn21.F \
basn31.f bassto.F blas.F ccaux.f ccsdt.F chgpen.F cisgrd.F cosmo.F \
cphf.F cpmchf.f cprohf.F ddi.F delocl.F dft.F dftaux.F dftexc.F dftfun.f \
dftgrd.F dftint.F dgeev.f dmulti.F drc.F dummygetenv.F ecp.F ecpder.F \
ecplib.F ecppot.f efdrvr.F efelec.f efgrd2.F efgrda.F efgrdb.F efgrdc.F \
efinp.F efinta.F efintb.F efpaul.F efpcm.F efpcov.F eigen.F eomcc.F \
ffield.F frfmt.F fsodci.F gamess.F globop.F gradex.F grd1.F grd2a.F \
grd2b.f grd2c.F guess.F gugdga.F gugdgb.F gugdm.F gugdm2.F gugdrt.F \
gugem.F gugsrt.F gvb.F hess.F hss1a.F hss1b.F hss2a.F hss2b.F inputa.F \
inputb.F inputc.F int1.F int2a.F int2b.f iolib.F lagran.F local.F \
loccd.F locpol.F mccas.F mcjac.f mcpinp.F mcpint.F mcplib.f mcqdpt.F \
mcqdwt.f mcqud.F mcscf.F mctwo.F morokm.F mp2.F mp2ddi.F mp2grd.F \
mpcdat.f mpcgrd.F mpcint.F mpcmol.F mpcmsc.F mthlib.F nameio.F nmr.F \
olix.f ordint.F ormas1.F parley.F pcm.F pcmcav.f pcmcv2.F pcmder.F \
pcmdis.F pcmief.F pcmpol.F pcmvch.F prpel.F prplib.F prppop.F qeigen.F \
qfmm.F qmfm.F qmmm.F qrel.F raman.F rhfuhf.F rxncrd.F ryspol.f scflib.F \
scfmi.F scrf.F sobrt.F soffac.F solib.F sozeff.F statpt.F surf.F \
symorb.F symslc.F tdhf.F trans.F trfdm2.F trnstn.F trudge.F umpddi.F \
unport.F vibanl.F vscf.F zheev.F zmatrx.F)

SPECPPFLAGS = -DSPEC_CPU_NO_HOLLERITH -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64

include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/exam29.out, data/test/output/exam29.out)

train-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/h2ocu2+.energy.out, data/train/output/h2ocu2+.energy.out)

ref-cmp:
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/cytosine.2.out, data/ref/output/cytosine.2.out)
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/h2ocu2+.gradient.out, data/ref/output/h2ocu2+.gradient.out)
	$(call SPECDIFF, --abstol 1e-05  --reltol 0.0001  --ignorecase, run/triazolium.out, data/ref/output/triazolium.out)
include Makefile.deps
