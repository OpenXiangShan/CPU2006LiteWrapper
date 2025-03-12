NAME = 453.povray
SRCS = $(addprefix src/, atmosph.cpp bbox.cpp bcyl.cpp bezier.cpp blob.cpp boxes.cpp \
	 bsphere.cpp camera.cpp chi2.cpp colour.cpp colutils.cpp cones.cpp \
	 csg.cpp defaultplatformbase.cpp defaultrenderfrontend.cpp discs.cpp \
	 express.cpp fileinputoutput.cpp fncode.cpp fnintern.cpp fnpovfpu.cpp \
	 fnsyntax.cpp fpmetric.cpp fractal.cpp function.cpp hcmplx.cpp hfield.cpp \
	 histogra.cpp iff.cpp image.cpp interior.cpp isosurf.cpp lathe.cpp \
	 lbuffer.cpp lightgrp.cpp lighting.cpp mathutil.cpp matrices.cpp \
	 media.cpp mesh.cpp messageoutput.cpp normal.cpp objects.cpp octree.cpp \
	 optout.cpp parse.cpp parsestr.cpp parstxtr.cpp pattern.cpp pgm.cpp \
	 photons.cpp pigment.cpp planes.cpp point.cpp poly.cpp polygon.cpp \
	 polysolv.cpp pov_mem.cpp pov_util.cpp povms.cpp povmscpp.cpp \
	 povmsend.cpp povmsrec.cpp povray.cpp ppm.cpp prism.cpp \
	 processoptions.cpp processrenderoptions.cpp quadrics.cpp quatern.cpp \
	 rad_data.cpp radiosit.cpp ray.cpp rendctrl.cpp render.cpp \
	 renderfrontend.cpp renderio.cpp sor.cpp specrand.cpp spec_qsort.cpp \
	 spheres.cpp sphsweep.cpp splines.cpp statspov.cpp stringutilities.cpp \
	 super.cpp targa.cpp textstream.cpp textstreambuffer.cpp texture.cpp \
	 tokenize.cpp torus.cpp triangle.cpp truetype.cpp txttest.cpp \
	 userdisp.cpp userio.cpp vbuffer.cpp vlbuffer.cpp warps.cpp)
LD_CXX = 1
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 0  --reltol 0.0002, $(RUN_DIR)/SPEC-benchmark.log, data/test/output/SPEC-benchmark.log),SPEC-benchmark.log) \
	$(call only_check, $(call SPECDIFF, --abstol 0  --reltol 0.0002  --skiptol 50 --binary, $(RUN_DIR)/SPEC-benchmark.tga, data/test/output/SPEC-benchmark.tga),SPEC-benchmark.tga) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 0  --reltol 5e-05, $(RUN_DIR)/SPEC-benchmark.log, data/train/output/SPEC-benchmark.log),SPEC-benchmark.log) \
	$(call only_check, $(call SPECDIFF, --abstol 0  --reltol 5e-05  --skiptol 50 --binary, $(RUN_DIR)/SPEC-benchmark.tga, data/train/output/SPEC-benchmark.tga),SPEC-benchmark.tga) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 0  --reltol 5e-05, $(RUN_DIR)/SPEC-benchmark.log, data/ref/output/SPEC-benchmark.log),SPEC-benchmark.log) \
	$(call only_check, $(call SPECDIFF, --abstol 0  --reltol 5e-05  --skiptol 50 --binary, $(RUN_DIR)/SPEC-benchmark.tga, data/ref/output/SPEC-benchmark.tga),SPEC-benchmark.tga) \
	$(call check_all_result)
include Makefile.deps
