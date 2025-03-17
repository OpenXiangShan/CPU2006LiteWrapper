NAME = 434.zeusmp
SRCS = $(addprefix src/, advx1.f advx2.f advx3.f avisc.f avisc_d.f bndyflgs.f bval3d.f \
bvalemf.f ct.f dataio.f diverg.f empty.f findno.f forces.f forces_d.f \
fourn.f ggen.f grdv.f hdfall.f hsmoc.f intchk.f lorentz.f lorentz_d.f \
maxmin.f mnmx.f momx1.f momx2.f momx3.f movie.f msave.f mstart.f newdt.f \
newgrid.f newvg.f newx1.f newx2.f nudt.f pdv.f pdv_d.f gpbv.f pressure.f \
printd.f restart.f setup.f spenergy.f srcstep.f strtoi.f tslice.f \
transprt.f tranx1.f tranx2.f tranx3.f zeusmp.F blast.f textdmp.f \
linpck.f)
LD_FORTRAN = 1
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --abstol 0.001  --reltol 0.001, $(RUN_DIR)/tsl000aa, data/test/output/tsl000aa),tsl000aa) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --abstol 0.001  --reltol 0.001, $(RUN_DIR)/tsl000aa, data/train/output/tsl000aa),tsl000aa) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call check_single_result, $(call SPECDIFF, --abstol 0.001  --reltol 0.001, $(RUN_DIR)/tsl000aa, data/ref/output/tsl000aa),tsl000aa) \
	$(call check_all_result)
include Makefile.deps
