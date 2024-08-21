NAME = 433.milc
SRCS = $(addprefix src/, control.c f_meas.c gauge_info.c setup.c update.c update_h.c \
	 update_u.c layout_hyper.c check_unitarity.c d_plaq4.c gaugefix2.c \
	 io_helpers.c io_lat4.c make_lattice.c path_product.c ploop3.c ranmom.c \
	 ranstuff.c reunitarize2.c gauge_stuff.c grsource_imp.c mat_invert.c \
	 quark_stuff.c rephase.c cmplx.c addmat.c addvec.c clear_mat.c clearvec.c \
	 m_amatvec.c m_mat_an.c m_mat_na.c m_mat_nn.c m_matvec.c make_ahmat.c \
	 rand_ahmat.c realtr.c s_m_a_mat.c s_m_a_vec.c s_m_s_mat.c s_m_vec.c \
	 s_m_mat.c su3_adjoint.c su3_dot.c su3_rdot.c su3_proj.c su3mat_copy.c \
	 submat.c subvec.c trace_su3.c uncmp_ahmat.c msq_su3vec.c sub4vecs.c \
	 m_amv_4dir.c m_amv_4vec.c m_mv_s_4dir.c m_su2_mat_vec_n.c l_su2_hit_n.c \
	 r_su2_hit_a.c m_su2_mat_vec_a.c gaussrand.c byterevn.c m_mat_hwvec.c \
	 m_amat_hwvec.c dslash_fn2.c d_congrad5_fn.c com_vanilla.c io_nonansi.c)

CFLAGS += -I./src -DFN -DFAST -DCONGRAD_TMP_VECTORS -DDSLASH_TMP_LINKS
LIBS += -lm
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --abstol 2e-07 --reltol 0.0001, run/su3imp.out, data/test/output/su3imp.out)

train-cmp:
	$(call SPECDIFF, --abstol 2e-07 --reltol 0.0001, run/su3imp.out, data/train/output/su3imp.out)

ref-cmp:
	$(call SPECDIFF, --abstol 2e-07 --reltol 0.0001, run/su3imp.out, data/ref/output/su3imp.out)
include Makefile.deps
