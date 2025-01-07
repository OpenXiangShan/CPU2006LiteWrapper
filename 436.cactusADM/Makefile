NAME = 436.cactusADM
SRCS = $(addprefix src/, PreLoop.F StaggeredLeapfrog1a.F StaggeredLeapfrog1a_TS.F \
StaggeredLeapfrog2.F planewaves.F teukwaves.F datestamp.c regex.c \
PUGH/GHExtension.c PUGH/FinishReceiveGA.c PUGH/Startup.c PUGH/Evolve.c \
PUGH/Storage.c PUGH/SetupGroup.c PUGH/PostSendGA.c PUGH/SetupPGH.c \
PUGH/SetupPGV.c PUGH/LoadAware.c PUGH/Comm.c PUGH/cctk_ThornBindings.c \
PUGH/Overloadables.c PUGH/PughUtils.c PUGH/PostReceiveGA.c \
Time/Courant.c Time/Initialise.c Time/cctk_ThornBindings.c Time/Given.c \
Time/Simple.c Cactus/ScheduleTraverse.c Cactus/Groups.c Cactus/Dummies.c \
Cactus/File.c Cactus/CactusDefaultEvolve.c Cactus/BinaryTree.c \
Cactus/Hash.c Cactus/Malloc.c Cactus/CactusTimers.c \
Cactus/CallStartupFunctions.c Cactus/FortranBindingsIO.c \
Cactus/ConfigData.c Cactus/CactusDefaultMainLoopIndex.c Cactus/Misc.c \
Cactus/CactusDefaultComm.c Cactus/Cache.c Cactus/RegisterKeyedFunction.c \
Cactus/Subsystems.c Cactus/FortranWrappers.c Cactus/Network.c \
Cactus/Stagger.c Cactus/CactusDefaultInitialise.c Cactus/Time.c \
Cactus/Expression.c Cactus/CactusSync.c Cactus/ProcessCommandLine.c \
Cactus/WarnLevel.c Cactus/CommandLine.c Cactus/Coord.c \
Cactus/ScheduleInterface.c Cactus/MainUtils.c Cactus/Reduction.c \
Cactus/GHExtensions.c Cactus/StoreHandledData.c Cactus/ShutdownCactus.c \
Cactus/ProcessEnvironment.c Cactus/getopt.c Cactus/ParseFile.c \
Cactus/OverloadIO.c Cactus/StoreKeyedData.c Cactus/getopt1.c \
Cactus/CactusDefaultShutdown.c Cactus/Banner.c Cactus/Termination.c \
Cactus/ProcessParameterDatabase.c Cactus/ActiveThorns.c Cactus/String.c \
Cactus/SetupCache.c Cactus/Table.c Cactus/DebugDefines.c Cactus/Interp.c \
Cactus/Parameters.c Cactus/GroupsOnGH.c Cactus/InitialiseCactus.c \
Cactus/IOMethods.c Cactus/flesh.c Cactus/ScheduleCreater.c \
Cactus/SetParams.c Cactus/cctk_ThornBindings.c Cactus/OverloadComm.c \
Cactus/Names.c Cactus/InitialiseDataStructures.c Cactus/StringList.c \
Cactus/DefaultTimers.c Cactus/StoreNamedData.c Cactus/ScheduleSorter.c \
Cactus/Complex.c Cactus/OverloadMain.c Cactus/Traverse.c \
Cactus/SKBinTree.c Cactus/snprintf.c IOUtil/CheckpointRecovery.c \
IOUtil/Utils.c IOUtil/AdvertisedFiles.c IOUtil/Startup.c \
IOUtil/cctk_ThornBindings.c IDLinearWaves/cctk_ThornBindings.c \
BenchADMsrc/Startup.c BenchADMsrc/ParamCheck.c \
BenchADMsrc/cctk_ThornBindings.c \
CactusBindings/ParameterRecoveryEinstein.c \
CactusBindings/ParameterRecoveryCactus.c CactusBindings/TIME_private.c \
CactusBindings/OverloadThorns.c CactusBindings/Cactus.c \
CactusBindings/PUGH_Register.c CactusBindings/EINSTEIN_restricted.c \
CactusBindings/ParameterRecoveryIOASCII.c CactusBindings/IOASCII.c \
CactusBindings/CreateTimeParameters.c \
CactusBindings/BOUNDARY_restricted.c \
CactusBindings/CreateIOBasicParameters.c CactusBindings/Global.c \
CactusBindings/ParameterRecoveryPUGH.c CactusBindings/EINSTEIN_private.c \
CactusBindings/CARTGRID3D_private.c \
CactusBindings/BindingsParameterRecovery.c CactusBindings/PUGH.c \
CactusBindings/ParameterRecoveryPUGHSlab.c CactusBindings/SchedulePUGH.c \
CactusBindings/IOUtil_Register.c CactusBindings/TIME_restricted.c \
CactusBindings/Cactus_FortranWrapper.c \
CactusBindings/ParameterRecoveryTime.c \
CactusBindings/BenchADM_FortranWrapper.c \
CactusBindings/IOASCII_private.c CactusBindings/PUGHReduce.c \
CactusBindings/CACTUS_private.c CactusBindings/Time.c \
CactusBindings/ScheduleTime.c CactusBindings/Boundary_Register.c \
CactusBindings/PUGHReduce_Register.c \
CactusBindings/CreateEinsteinParameters.c \
CactusBindings/BindingsSchedule.c \
CactusBindings/CreateIOASCIIParameters.c \
CactusBindings/CreatePUGHParameters.c CactusBindings/BENCHADM_private.c \
CactusBindings/CreateBenchADMParameters.c \
CactusBindings/CreateIOUtilParameters.c \
CactusBindings/CreateCartGrid3DParameters.c \
CactusBindings/IDLINEARWAVES_private.c CactusBindings/Boundary.c \
CactusBindings/Einstein.c CactusBindings/CreateIDLinearWavesParameters.c \
CactusBindings/ParameterRecoveryBenchADM.c \
CactusBindings/ParameterRecoveryIOBasic.c CactusBindings/PUGH_private.c \
CactusBindings/ScheduleIOASCII.c CactusBindings/PUGHSlab_Register.c \
CactusBindings/ScheduleBoundary.c \
CactusBindings/CreatePUGHReduceParameters.c CactusBindings/IOBasic.c \
CactusBindings/ScheduleEinstein.c \
CactusBindings/ParameterRecoveryPUGHReduce.c CactusBindings/CartGrid3D.c \
CactusBindings/IOASCII_Register.c \
CactusBindings/IDLinearWaves_FortranWrapper.c \
CactusBindings/PUGH_FortranWrapper.c \
CactusBindings/ScheduleIDLinearWaves.c \
CactusBindings/DummyThornFunctions.c \
CactusBindings/CreateBoundaryParameters.c CactusBindings/IO_restricted.c \
CactusBindings/PUGHSlab.c CactusBindings/BenchADM_Register.c \
CactusBindings/CartGrid3D_Register.c CactusBindings/SchedulePUGHSlab.c \
CactusBindings/ParameterRecoveryIDLinearWaves.c \
CactusBindings/IOBASIC_private.c CactusBindings/SchedulePUGHReduce.c \
CactusBindings/PUGHReduce_FortranWrapper.c \
CactusBindings/ScheduleIOUtil.c CactusBindings/Einstein_Register.c \
CactusBindings/CreateCactusParameters.c CactusBindings/Time_Register.c \
CactusBindings/IOBasic_FortranWrapper.c \
CactusBindings/CreatePUGHSlabParameters.c \
CactusBindings/CACTUS_restricted.c CactusBindings/BindingsVariables.c \
CactusBindings/IsOverloaded.c CactusBindings/Cactus_Register.c \
CactusBindings/Einstein_FortranWrapper.c \
CactusBindings/ParameterRecoveryIOUtil.c CactusBindings/IOUtil.c \
CactusBindings/ParameterRecoveryCartGrid3D.c \
CactusBindings/PUGHSlab_FortranWrapper.c \
CactusBindings/BENCHADM_restricted.c CactusBindings/BindingsParameters.c \
CactusBindings/CartGrid3D_FortranWrapper.c \
CactusBindings/RegisterThornFunctions.c \
CactusBindings/Boundary_FortranWrapper.c \
CactusBindings/ScheduleIOBasic.c CactusBindings/BenchADM.c \
CactusBindings/IOBasic_Register.c CactusBindings/IDLinearWaves.c \
CactusBindings/Time_FortranWrapper.c \
CactusBindings/IDLinearWaves_Register.c \
CactusBindings/IOASCII_FortranWrapper.c \
CactusBindings/ScheduleBenchADM.c CactusBindings/ScheduleCactus.c \
CactusBindings/ImplementationBindings.c \
CactusBindings/DRIVER_restricted.c \
CactusBindings/IOUtil_FortranWrapper.c \
CactusBindings/ScheduleCartGrid3D.c \
CactusBindings/FortranThornFunctions.c CactusBindings/GRID_restricted.c \
CactusBindings/ParameterRecoveryBoundary.c CartGrid3D/SymmetryWrappers.c \
CartGrid3D/GHExtension.c CartGrid3D/DecodeSymParameters.c \
CartGrid3D/SetSymmetry.c CartGrid3D/Startup.c CartGrid3D/CartGrid3D.c \
CartGrid3D/Symmetry.c CartGrid3D/ParamCheck.c \
CartGrid3D/cctk_ThornBindings.c Einstein/Courant.c \
Einstein/InitialEinstein.c Einstein/MaskInit.c Einstein/Slicing.c \
Einstein/InitialFlat.c Einstein/carttosphere.c Einstein/InitSymBound.c \
Einstein/LapseInits.c Einstein/cctk_ThornBindings.c \
Einstein/ShiftInits.c Einstein/evaltrK.c Einstein/ConfPhys.c \
PUGHReduce/ReductionNormInf.c PUGHReduce/ReductionMax.c \
PUGHReduce/ReductionMin.c PUGHReduce/ReductionSum.c PUGHReduce/Startup.c \
PUGHReduce/Reduction.c PUGHReduce/ReductionNorm1.c \
PUGHReduce/ReductionNorm2.c PUGHReduce/cctk_ThornBindings.c \
Boundary/FlatBoundary.c Boundary/ScalarBoundary.c \
Boundary/RadiationBoundary.c Boundary/RobinBoundary.c \
Boundary/CopyBoundary.c Boundary/cctk_ThornBindings.c \
PUGHSlab/DatatypeConversion.c PUGHSlab/GetHyperslab.c PUGHSlab/Mapping.c \
PUGHSlab/Hyperslab.c PUGHSlab/cctk_ThornBindings.c \
PUGHSlab/NewHyperslab.c IOASCII/Output1D.c IOASCII/Output2D.c \
IOASCII/Output3D.c IOASCII/Startup.c IOASCII/cctk_ThornBindings.c \
IOASCII/ChooseOutput.c IOASCII/Write1D.c IOASCII/Write2D.c \
IOASCII/Write3D.c IOBasic/WriteScalar.c IOBasic/OutputScalar.c \
IOBasic/OutputInfo.c IOBasic/Startup.c IOBasic/WriteInfo.c \
IOBasic/cctk_ThornBindings.c)

CFLAGS += -I./src/include -DCCODE -D__USE_BSD -std=c99
SPECPPFLAGS = -DSPEC_CPU -DNDEBUG -DSPEC_CPU_LP64
LD_FORTRAN = 1
include ../Makefile.apps

test-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/test/output/benchADM.out)

train-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/train/output/benchADM.out)

ref-cmp:
	$(call SPECDIFF, --floatcompare, run/benchADM.out, data/ref/output/benchADM.out)
include Makefile.deps
