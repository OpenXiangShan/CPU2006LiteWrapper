NAME = gromacs
SRCS = src/flincs.f src/fsettle.F src/fshake.f src/innerf.f src/flincsd.f src/fsettled.F src/fshaked.f src/3dview.c src/atomprop.c src/binio.c src/block_tx.c src/bondfree.c src/buffer.c src/calcgrid.c src/calch.c src/calcmu.c src/calcvir.c src/clincs.c src/comlib.c src/confio.c src/constr.c src/copyrite.c src/coupling.c src/csettle.c src/disre.c src/do_fit.c src/do_gct.c src/dummies.c src/ebin.c src/edsam.c src/enxio.c src/ewald.c src/ewald_util.c src/f77_wrappers.c src/fatal.c src/ffscanf.c src/fftgrid.c src/filenm.c src/fnbf.c src/force.c src/futil.c src/gbutil.c src/gctio.c src/genalg.c src/ghat.c src/glaasje.c src/gmx_system_xdr.c src/gmxfio.c src/ifunc.c src/index.c src/init.c src/init_sh.c src/innerc.c src/invblock.c src/ionize.c src/libxdrf.c src/macros.c src/main.c src/maths.c src/matio.c src/md.c src/mdatom.c src/mdebin.c src/mdrun.c src/memdump.c src/minimize.c src/mshift.c src/mvdata.c src/mvxvf.c src/names.c src/network.c src/nrama.c src/nrjac.c src/nrnb.c src/ns.c src/nsb.c src/nsgrid.c src/orires.c src/pargs.c src/pbc.c src/pdbio.c src/pme.c src/poisson.c src/pppm.c src/princ.c src/psgather.c src/pssolve.c src/psspread.c src/pull.c src/pullinit.c src/pullio.c src/pullutil.c src/rando.c src/random.c src/rbin.c src/rdgroup.c src/readinp.c src/relax_sh.c src/replace.c src/rmpbc.c src/shakef.c src/shift_util.c src/sim_util.c src/smalloc.c src/sortwater.c src/splittop.c src/stat.c src/statutil.c src/strdb.c src/string2.c src/symtab.c src/synclib.c src/tables.c src/tgroup.c src/tpxio.c src/trnio.c src/trxio.c src/txtdump.c src/typedefs.c src/update.c src/vcm.c src/vec.c src/viewit.c src/wgms.c src/wman.c src/wnblist.c src/writeps.c src/xdrd.c src/xtcio.c src/xutils.c src/xvgr.c
CFLAGS += -I./src -DHAVE_CONFIG_H
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --reltol 0.0125, run/gromacs.out, data/test/output/gromacs.out)

train-cmp:
	$(call SPECDIFF, --reltol 0.0125, run/gromacs.out, data/train/output/gromacs.out)

ref-cmp:
	$(call SPECDIFF, --reltol 0.0125, run/gromacs.out, data/ref/output/gromacs.out)
