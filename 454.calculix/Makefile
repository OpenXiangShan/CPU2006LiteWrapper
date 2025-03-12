NAME = 454.calculix
SRCS = $(addprefix src/, CalculiX.c add_pr.f add_sm_ei.f add_sm_st.f allocation.f \
	 amplitudes.f anisotropic.f beamsections.f bounadd.f boundaries.f \
	 buckles.f calinput.f cfluxes.f changedepterm.f cloads.f conductivities.f \
	 controlss.f couptempdisps.f creeps.f cychards.f cycsymmods.f dasol.f \
	 datest.f datri.f defplasticities.f defplas.f densities.f depvars.f \
	 deuldlag.f dfluxes.f dgesv.f diamtr.f dloads.f dot.f dredu.f dsort.f \
	 dynamics.f dynsolv.f el.f elastics.f elements.f elprints.f envtemp.f \
	 equations.f expansions.f extrapolate.f e_c3d.f e_c3d_th.f e_c3d_rhs.f \
	 fcrit.f films.f finpro.f forcadd.f frd.F frdclose.f frequencies.f fsub.f \
	 fsuper.f gen3delem.f genran.f getnewline.f graph.f headings.f \
	 heattransfers.f hyperel.f hyperelastics.f hyperfoams.f ident.f ident2.f \
	 include.f incplas.f initialconditions.f inputerror.f isorti.f isortid.f \
	 isortidc.f isortii.f isortiid.f label.f linel.f lintemp.f lintemp_th.f \
	 loadadd.f loadaddt.f mafillpr.f mafillsm.f mafillsmcs.f massflowrates.f \
	 matdata_co.f matdata_he.f matdata_tg.f materialdata.f materials.f \
	 modaldampings.f modaldynamics.f mpcs.f nident.f nident2.f near2d.f \
	 noanalysis.f nodalthicknesses.f nodeprints.f nodes.f noelfiles.f \
	 noelsets.f nonlinmpc.f normals.f norshell.f number.f onf.f op.f \
	 openfile.f orientations.f orthonl.f orthotropic.f out.f parser.f \
	 physicalconstants.f planempc.f plastics.f plcopy.f plinterpol.f plmix.f \
	 polynom.f profil.f radflowload.f radiates.f ranewr.f rearrange.f \
	 rectcyl.f renumber.f restartread.f restarts.f restartshort.f \
	 restartwrite.f results.f rhs.f rigidbodies.f rigidmpc.f rootls.f \
	 rubber.f saxpb.f selcycsymmods.f shape3tri.f shape4q.f shape4tet.f \
	 shape6tri.f shape6w.f shape8h.f shape8q.f shape10tet.f shape15w.f \
	 shape20h.f shellsections.f skip.f solidsections.f spcmatch.f \
	 specificheats.f statics.f steps.f stiff2mat.f stop.f str2mat.f \
	 straightmpc.f surfaces.f temperatures.f tempload.f ties.f \
	 transformatrix.f transforms.f ucreep.f uhardening.f umat.f \
	 umat_aniso_creep.f umat_aniso_plas.f umat_elastic_fiber.f \
	 umat_ideal_gas.f umat_lin_iso_el.f umat_single_crystal.f \
	 umat_tension_only.f umat_user.f umpc_mean_rot.f umpc_user.f \
	 usermaterials.f usermpc.f viscos.f wcoef.f writebv.f writeev.f \
	 writeevcs.f writempc.f writesummary.f cascade.c frdcyc.c insert.c \
	 mastruct.c mastructcs.c nonlingeo.c pcgsolver.c preiter.c prespooles.c \
	 profile.c remastruct.c spooles.c strcmp1.c strcpy1.c u_calloc.c \
	 SPOOLES/A2/src/A2_IO.c SPOOLES/A2/src/A2_basics.c \
	 SPOOLES/A2/src/A2_init.c SPOOLES/A2/src/A2_instance.c \
	 SPOOLES/A2/src/A2_norms.c SPOOLES/A2/src/A2_sort.c \
	 SPOOLES/A2/src/A2_util.c SPOOLES/BKL/src/BKL_basics.c \
	 SPOOLES/BKL/src/BKL_evalfcn.c SPOOLES/BKL/src/BKL_exhSearch.c \
	 SPOOLES/BKL/src/BKL_fidmat.c SPOOLES/BKL/src/BKL_init.c \
	 SPOOLES/BKL/src/BKL_util.c SPOOLES/BPG/src/BPG_IO.c \
	 SPOOLES/BPG/src/BPG_basics.c SPOOLES/BPG/src/BPG_init.c \
	 SPOOLES/BPG/src/BPG_makeGraphs.c SPOOLES/BPG/src/BPG_pseudo.c \
	 SPOOLES/Chv/src/Chv_IO.c SPOOLES/Chv/src/Chv_assemble.c \
	 SPOOLES/Chv/src/Chv_basics.c SPOOLES/Chv/src/Chv_copy.c \
	 SPOOLES/Chv/src/Chv_factor.c SPOOLES/Chv/src/Chv_findPivot.c \
	 SPOOLES/Chv/src/Chv_init.c SPOOLES/Chv/src/Chv_instance.c \
	 SPOOLES/Chv/src/Chv_search.c SPOOLES/Chv/src/Chv_swap.c \
	 SPOOLES/Chv/src/Chv_update.c SPOOLES/Chv/src/Chv_util.c \
	 SPOOLES/ChvList/src/ChvList_basics.c SPOOLES/ChvList/src/ChvList_init.c \
	 SPOOLES/ChvList/src/ChvList_util.c \
	 SPOOLES/ChvManager/src/ChvManager_basics.c \
	 SPOOLES/ChvManager/src/ChvManager_init.c \
	 SPOOLES/ChvManager/src/ChvManager_util.c \
	 SPOOLES/DSTree/src/DSTree_basics.c SPOOLES/DSTree/src/DSTree_init.c \
	 SPOOLES/DSTree/src/DSTree_instance.c SPOOLES/DSTree/src/DSTree_stages.c \
	 SPOOLES/DSTree/src/DSTree_util.c SPOOLES/DV/src/DV_IO.c \
	 SPOOLES/DV/src/DV_basics.c SPOOLES/DV/src/DV_init.c \
	 SPOOLES/DV/src/DV_instance.c SPOOLES/DV/src/DV_util.c \
	 SPOOLES/DenseMtx/src/DenseMtx_IO.c \
	 SPOOLES/DenseMtx/src/DenseMtx_basics.c \
	 SPOOLES/DenseMtx/src/DenseMtx_init.c \
	 SPOOLES/DenseMtx/src/DenseMtx_instance.c \
	 SPOOLES/DenseMtx/src/DenseMtx_permute.c \
	 SPOOLES/DenseMtx/src/DenseMtx_util.c SPOOLES/Drand/src/Drand_basics.c \
	 SPOOLES/Drand/src/Drand_init.c SPOOLES/Drand/src/Drand_util.c \
	 SPOOLES/ETree/src/ETree_IO.c SPOOLES/ETree/src/ETree_basics.c \
	 SPOOLES/ETree/src/ETree_compress.c SPOOLES/ETree/src/ETree_init.c \
	 SPOOLES/ETree/src/ETree_instance.c SPOOLES/ETree/src/ETree_permute.c \
	 SPOOLES/ETree/src/ETree_transform.c SPOOLES/ETree/src/ETree_util.c \
	 SPOOLES/FrontMtx/src/FrontMtx_IO.c \
	 SPOOLES/FrontMtx/src/FrontMtx_basics.c \
	 SPOOLES/FrontMtx/src/FrontMtx_factor.c \
	 SPOOLES/FrontMtx/src/FrontMtx_factorUtil.c \
	 SPOOLES/FrontMtx/src/FrontMtx_init.c \
	 SPOOLES/FrontMtx/src/FrontMtx_instance.c \
	 SPOOLES/FrontMtx/src/FrontMtx_loadEntries.c \
	 SPOOLES/FrontMtx/src/FrontMtx_permute.c \
	 SPOOLES/FrontMtx/src/FrontMtx_postProcess.c \
	 SPOOLES/FrontMtx/src/FrontMtx_postponed.c \
	 SPOOLES/FrontMtx/src/FrontMtx_solve.c \
	 SPOOLES/FrontMtx/src/FrontMtx_solveUtil.c \
	 SPOOLES/FrontMtx/src/FrontMtx_split.c \
	 SPOOLES/FrontMtx/src/FrontMtx_storeFront.c \
	 SPOOLES/FrontMtx/src/FrontMtx_update.c \
	 SPOOLES/FrontMtx/src/FrontMtx_util.c SPOOLES/GPart/src/GPart_DDsepInfo.c \
	 SPOOLES/GPart/src/GPart_DDviaFishnet.c \
	 SPOOLES/GPart/src/GPart_DDviaProjection.c \
	 SPOOLES/GPart/src/GPart_RBviaDDsep.c \
	 SPOOLES/GPart/src/GPart_TwoSetViaBKL.c SPOOLES/GPart/src/GPart_basics.c \
	 SPOOLES/GPart/src/GPart_domSegMap.c \
	 SPOOLES/GPart/src/GPart_identifyWideSep.c SPOOLES/GPart/src/GPart_init.c \
	 SPOOLES/GPart/src/GPart_makeYCmap.c \
	 SPOOLES/GPart/src/GPart_smoothBisector.c \
	 SPOOLES/GPart/src/GPart_smoothBy2layers.c \
	 SPOOLES/GPart/src/GPart_smoothYSep.c SPOOLES/GPart/src/GPart_split.c \
	 SPOOLES/GPart/src/GPart_util.c SPOOLES/Graph/src/Graph_IO.c \
	 SPOOLES/Graph/src/Graph_basics.c SPOOLES/Graph/src/Graph_compress.c \
	 SPOOLES/Graph/src/Graph_equivMap.c SPOOLES/Graph/src/Graph_init.c \
	 SPOOLES/Graph/src/Graph_util.c SPOOLES/I2Ohash/src/I2Ohash_basics.c \
	 SPOOLES/I2Ohash/src/I2Ohash_init.c SPOOLES/I2Ohash/src/I2Ohash_util.c \
	 SPOOLES/IIheap/src/IIheap_basics.c SPOOLES/IV/src/IV_IO.c \
	 SPOOLES/IV/src/IV_basics.c SPOOLES/IV/src/IV_init.c \
	 SPOOLES/IV/src/IV_instance.c SPOOLES/IV/src/IV_util.c \
	 SPOOLES/IVL/src/IVL_IO.c SPOOLES/IVL/src/IVL_basics.c \
	 SPOOLES/IVL/src/IVL_init.c SPOOLES/IVL/src/IVL_instance.c \
	 SPOOLES/IVL/src/IVL_listmanip.c SPOOLES/IVL/src/IVL_util.c \
	 SPOOLES/Ideq/src/Ideq_basics.c SPOOLES/Ideq/src/Ideq_resize.c \
	 SPOOLES/Ideq/src/Ideq_util.c SPOOLES/InpMtx/src/InpMtx_IO.c \
	 SPOOLES/InpMtx/src/InpMtx_basics.c SPOOLES/InpMtx/src/InpMtx_fullAdj.c \
	 SPOOLES/InpMtx/src/InpMtx_init.c SPOOLES/InpMtx/src/InpMtx_input.c \
	 SPOOLES/InpMtx/src/InpMtx_instance.c SPOOLES/InpMtx/src/InpMtx_permute.c \
	 SPOOLES/InpMtx/src/InpMtx_util.c SPOOLES/Lock/src/Lock_basics.c \
	 SPOOLES/Lock/src/Lock_init.c SPOOLES/Lock/src/Lock_util.c \
	 SPOOLES/MSMD/src/MSMD_MSMDinfo.c SPOOLES/MSMD/src/MSMD_MSMDvtx.c \
	 SPOOLES/MSMD/src/MSMD_basics.c SPOOLES/MSMD/src/MSMD_cleanReachSet.c \
	 SPOOLES/MSMD/src/MSMD_eliminate.c SPOOLES/MSMD/src/MSMD_findInodes.c \
	 SPOOLES/MSMD/src/MSMD_frontETree.c SPOOLES/MSMD/src/MSMD_init.c \
	 SPOOLES/MSMD/src/MSMD_order.c SPOOLES/MSMD/src/MSMD_update.c \
	 SPOOLES/Network/src/Network_IO.c SPOOLES/Network/src/Network_addArc.c \
	 SPOOLES/Network/src/Network_augmentPath.c \
	 SPOOLES/Network/src/Network_basics.c \
	 SPOOLES/Network/src/Network_findAugmentingPath.c \
	 SPOOLES/Network/src/Network_findMaxFlow.c \
	 SPOOLES/Network/src/Network_findMincut.c \
	 SPOOLES/Network/src/Network_init.c SPOOLES/Pencil/src/Pencil_IO.c \
	 SPOOLES/Pencil/src/Pencil_basics.c SPOOLES/Pencil/src/Pencil_init.c \
	 SPOOLES/SubMtx/src/SubMtx_IO.c SPOOLES/SubMtx/src/SubMtx_basics.c \
	 SPOOLES/SubMtx/src/SubMtx_init.c SPOOLES/SubMtx/src/SubMtx_instance.c \
	 SPOOLES/SubMtx/src/SubMtx_scalevec.c SPOOLES/SubMtx/src/SubMtx_solve.c \
	 SPOOLES/SubMtx/src/SubMtx_solveH.c SPOOLES/SubMtx/src/SubMtx_solveT.c \
	 SPOOLES/SubMtx/src/SubMtx_solveupd.c \
	 SPOOLES/SubMtx/src/SubMtx_solveupdH.c \
	 SPOOLES/SubMtx/src/SubMtx_solveupdT.c SPOOLES/SubMtx/src/SubMtx_sort.c \
	 SPOOLES/SubMtx/src/SubMtx_util.c \
	 SPOOLES/SubMtxList/src/SubMtxList_util.c \
	 SPOOLES/SubMtxManager/src/SubMtxManager_basics.c \
	 SPOOLES/SubMtxManager/src/SubMtxManager_init.c \
	 SPOOLES/SubMtxManager/src/SubMtxManager_util.c \
	 SPOOLES/SymbFac/src/SymbFac_symbfac.c SPOOLES/Tree/src/Tree_IO.c \
	 SPOOLES/Tree/src/Tree_basics.c SPOOLES/Tree/src/Tree_compress.c \
	 SPOOLES/Tree/src/Tree_init.c SPOOLES/Tree/src/Tree_metrics.c \
	 SPOOLES/Tree/src/Tree_perms.c SPOOLES/Tree/src/Tree_util.c \
	 SPOOLES/Utilities/src/Utilities_CV.c \
	 SPOOLES/Utilities/src/Utilities_DV.c \
	 SPOOLES/Utilities/src/Utilities_I2OP.c \
	 SPOOLES/Utilities/src/Utilities_IP.c \
	 SPOOLES/Utilities/src/Utilities_IV.c \
	 SPOOLES/Utilities/src/Utilities_PIV.c \
	 SPOOLES/Utilities/src/Utilities_ZV.c \
	 SPOOLES/Utilities/src/Utilities_iohb.c \
	 SPOOLES/Utilities/src/Utilities_newsort.c \
	 SPOOLES/Utilities/src/Utilities_sortAndCompress.c \
	 SPOOLES/ZV/src/ZV_basics.c SPOOLES/ZV/src/ZV_init.c \
	 SPOOLES/ZV/src/ZV_instance.c \
	 SPOOLES/misc/src/misc_orderViaBestOfNDandMS.c)
PPREFIX = .fppized.o
FFLAGS += -I$(abspath src/SPOOLES) -Wno-error
CFLAGS += -I$(abspath src/SPOOLES) -Wno-error
LD_FORTRAN = 1
LIBS += -lm
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
include ../Makefile.apps
include ../Makefile.run

test-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, $(RUN_DIR)/SPECtestformatmodifier_z.txt, data/test/output/SPECtestformatmodifier_z.txt), SPECtestformatmodifier_z.txt) \
	$(call only_check, $(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, $(RUN_DIR)/beampic.dat, data/test/output/beampic.dat) beampic.dat) \
	$(call check_all_result)

train-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, $(RUN_DIR)/SPECtestformatmodifier_z.txt, data/train/output/SPECtestformatmodifier_z.txt), SPECtestformatmodifier_z.txt) \
	$(call only_check, $(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, $(RUN_DIR)/stairs.dat, data/train/output/stairs.dat), stairs.dat) \
	$(call check_all_result)

ref-cmp:
	@total=0; success=0; failed=0; \
	$(call only_check, $(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, $(RUN_DIR)/SPECtestformatmodifier_z.txt, data/ref/output/SPECtestformatmodifier_z.txt), SPECtestformatmodifier_z.txt) \
	$(call only_check, $(call SPECDIFF, --abstol 1e-09  --reltol 1e-09 --obiwan, $(RUN_DIR)/hyperviscoplastic.dat, data/ref/output/hyperviscoplastic.dat),hyperviscoplastic.dat) \
	$(call check_all_result)
include Makefile.deps
