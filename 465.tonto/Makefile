NAME = 465.tonto
SRCS = $(addprefix src/, types.F90 system.F90 str.F90 int.F90 real.F90 intvec.F90 \
	 realvec.F90 binmat.F90 cpxvec.F90 realmat.F90 parallel.F90 intmat.F90 \
	 buffer.F90 intvecvec.F90 strvec.F90 binvec.F90 unitnumber.F90 \
	 textfile.F90 opvector.F90 file.F90 cpxmat.F90 opmatrix.F90 archive.F90 \
	 diis.F90 reflection.F90 cif.F90 cpxmat3.F90 realmat3.F90 spacegroup.F90 \
	 slatershell.F90 slatershellvec.F90 interpolator.F90 slaterbasis.F90 \
	 shell1.F90 unitcell.F90 shell.F90 shellvec.F90 basis.F90 \
	 coppensorbital.F90 coppensorbitalvec.F90 coppensbasis.F90 atom.F90 \
	 reflectionvec.F90 rys.F90 cpxmat4.F90 gaussian.F90 gaussian2.F90 \
	 realmat4.F90 intmat3.F90 shell2.F90 atomvec.F90 crystal.F90 scfdata.F90 \
	 basisvec.F90 realmat5.F90 gaussian4.F90 shell4.F90 time.F90 colour.F90 \
	 colourfunction.F90 intvecmat3.F90 intvecintvechash.F90 marchingcube.F90 \
	 plotgrid.F90 isosurface.F90 realmat3vec.F90 cluster.F90 cpxmat5.F90 \
	 shellpair.F90 shellpairvec.F90 coppensbasisvec.F90 irrep.F90 \
	 irrepvec.F90 pointgroup.F90 slaterbasisvec.F90 shell1quartet.F90 \
	 roby.F90 dftgrid.F90 mol.F90 mol_main.F90 run_mol.F90 blas.f90 \
	 lapack.f90)

SPECPPFLAGS = -w -DUSE_PRE_AND_POST_CONDITIONS -DUSE_ERROR_MANAGEMENT -m literal.pm -m tonto.pm -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --reltol 0.006, run/stdout, data/test/output/stdout)

train-cmp:
	$(call SPECDIFF, --reltol 0.006, run/stdout, data/train/output/stdout)

ref-cmp:
	$(call SPECDIFF, --reltol 0.006, run/stdout, data/ref/output/stdout)
include Makefile.deps
