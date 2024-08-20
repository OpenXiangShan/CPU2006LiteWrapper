NAME = 447.dealII
SRCS = $(addprefix src/,auto_derivative_function.cc block_sparse_matrix.cc \
block_sparse_matrix_ez.cc block_sparsity_pattern.cc block_vector.cc \
compressed_sparsity_pattern.cc data_out.cc data_out_base.cc \
data_out_faces.cc data_out_rotation.cc data_out_stack.cc \
derivative_approximation.cc dof_accessor.cc dof_constraints.cc \
dof_handler.cc dof_levels.cc dof_renumbering.cc dof_tools.cc \
error_estimator.cc exceptions.cc fe.cc fe_data.cc fe_dgp.cc fe_dgp_1d.cc \
fe_dgp_2d.cc fe_dgp_3d.cc fe_dgp_nonparametric.cc fe_dgq.cc fe_dgq_1d.cc \
fe_dgq_2d.cc fe_dgq_3d.cc fe_nedelec.cc fe_nedelec_1d.cc \
fe_nedelec_2d.cc fe_nedelec_3d.cc fe_q.cc fe_q_1d.cc fe_q_2d.cc \
fe_q_3d.cc fe_q_hierarchical.cc fe_raviart_thomas.cc fe_system.cc \
fe_tools.cc fe_values.cc filtered_matrix.cc full_matrix.double.cc \
full_matrix.float.cc function.cc function_derivative.cc function_lib.cc \
function_lib_cutoff.cc function_time.cc geometry_info.cc \
grid_generator.cc grid_in.cc grid_out.all_dimensions.cc grid_out.cc \
grid_refinement.cc grid_reordering.cc histogram.cc intergrid_map.cc \
job_identifier.cc log.cc mapping.cc mapping_c1.cc mapping_cartesian.cc \
mapping_q.cc mapping_q1.cc mapping_q1_eulerian.cc \
matrices.all_dimensions.cc matrices.cc matrix_lib.cc matrix_out.cc \
memory_consumption.cc mg_base.cc mg_dof_accessor.cc mg_dof_handler.cc \
mg_dof_tools.cc mg_smoother.cc mg_transfer_block.cc \
mg_transfer_prebuilt.cc mg_transfer_block.all_dimensions.cc \
multigrid.all_dimensions.cc multithread_info.cc parameter_handler.cc \
persistent_tria.cc polynomial.cc polynomial_space.cc programid.cc \
quadrature.cc quadrature_lib.cc solution_transfer.cc solver_control.cc \
sparse_matrix.double.cc sparse_matrix.float.cc \
sparse_matrix_ez.double.cc sparse_matrix_ez.float.cc sparsity_pattern.cc \
step-14.cc subscriptor.cc swappable_vector.cc tensor.cc \
tensor_product_polynomials.cc tria.all_dimensions.cc tria.cc \
tria_accessor.cc tria_boundary.cc tria_boundary_lib.cc vector.cc \
vector.long_double.cc vectors.all_dimensions.cc fe_dgp_monomial.cc \
fe_poly.cc polynomials_bdm.cc polynomials_p.cc fe_dgp_monomial.cc \
fe_poly.cc polynomials_bdm.cc polynomials_p.cc vectors.cc)
CFLAGS += -I$(abspath ./src/include) -DBOOST_DISABLE_THREADS -Ddeal_II_dimension=3 -fpermissive -include cstring
ifneq ($(ARCH),riscv64)
CFLAGS += -mlong-double-64
endif
LD_CXX = 1
include ../Makefile.apps

test-cmp:
	for i in 0 1 2 3 4 5 6 7 8; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/all/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/all/output/solution-$$i.gmv); \
	done
	$(call SPECDIFF, --abstol 1e-07, run/log, data/test/output/log)

train-cmp:
	for i in 0 1 2 3 4 5 6 7 8; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/all/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/all/output/solution-$$i.gmv); \
	done
	for i in 9 10; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/train/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/train/output/solution-$$i.gmv); \
	done
	$(call SPECDIFF, --abstol 1e-07, run/log, data/train/output/log)

ref-cmp:
	for i in 0 1 2 3 4 5 6 7 8; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/all/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/all/output/solution-$$i.gmv); \
	done
	for i in 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23; do \
		$(call SPECDIFF, --abstol 1e-07, run/grid-$$i.eps, data/ref/output/grid-$$i.eps); \
		$(call SPECDIFF, --abstol 1e-07, run/solution-$$i.gmv, data/ref/output/solution-$$i.gmv); \
	done
	$(call SPECDIFF, --abstol 1e-07, run/log, data/ref/output/log)
