NAME = tonto
SRCS = src/types.F90 src/system.F90 src/str.F90 src/int.F90 src/real.F90 src/intvec.F90 src/realvec.F90 src/binmat.F90 src/cpxvec.F90 src/realmat.F90 src/parallel.F90 src/intmat.F90 src/buffer.F90 src/intvecvec.F90 src/strvec.F90 src/binvec.F90 src/unitnumber.F90 src/textfile.F90 src/opvector.F90 src/file.F90 src/cpxmat.F90 src/opmatrix.F90 src/archive.F90 src/diis.F90 src/reflection.F90 src/cif.F90 src/cpxmat3.F90 src/realmat3.F90 src/spacegroup.F90 src/slatershell.F90 src/slatershellvec.F90 src/interpolator.F90 src/slaterbasis.F90 src/shell1.F90 src/unitcell.F90 src/shell.F90 src/shellvec.F90 src/basis.F90 src/coppensorbital.F90 src/coppensorbitalvec.F90 src/coppensbasis.F90 src/atom.F90 src/reflectionvec.F90 src/rys.F90 src/cpxmat4.F90 src/gaussian.F90 src/gaussian2.F90 src/realmat4.F90 src/intmat3.F90 src/shell2.F90 src/atomvec.F90 src/crystal.F90 src/scfdata.F90 src/basisvec.F90 src/realmat5.F90 src/gaussian4.F90 src/shell4.F90 src/time.F90 src/colour.F90 src/colourfunction.F90 src/intvecmat3.F90 src/intvecintvechash.F90 src/marchingcube.F90 src/plotgrid.F90 src/isosurface.F90 src/realmat3vec.F90 src/cluster.F90 src/cpxmat5.F90 src/shellpair.F90 src/shellpairvec.F90 src/coppensbasisvec.F90 src/irrep.F90 src/irrepvec.F90 src/pointgroup.F90 src/slaterbasisvec.F90 src/shell1quartet.F90 src/roby.F90 src/dftgrid.F90 src/mol.F90 src/mol_main.F90 src/run_mol.F90 src/blas.f90 src/lapack.f90

SPECPPFLAGS = -w -DUSE_PRE_AND_POST_CONDITIONS -DUSE_ERROR_MANAGEMENT -m literal.pm -m tonto.pm -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --reltol 0.006, run/stdout, data/test/output/stdout)

train-cmp:
	$(call SPECDIFF, --reltol 0.006, run/stdout, data/train/output/stdout)

ref-cmp:
	$(call SPECDIFF, --reltol 0.006, run/stdout, data/ref/output/stdout)
