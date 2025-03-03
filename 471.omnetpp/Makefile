NAME = 471.omnetpp
SRCS = $(addprefix src/, EtherAppCli.cc EtherAppCli_n.cc EtherAppSrv.cc EtherAppSrv_n.cc \
	 EtherApp_m.cc EtherBus.cc EtherBus_n.cc EtherCtrl_m.cc EtherEncap.cc \
	 EtherEncap_n.cc EtherFrame_m.cc EtherHost_n.cc EtherHub.cc EtherHub_n.cc \
	 EtherLLC.cc EtherLLC_n.cc EtherMAC.cc EtherMAC_n.cc EtherSwitch_n.cc \
	 LargeNet_n.cc MACAddress.cc MACAddress_m.cc MACRelayUnitBase.cc \
	 MACRelayUnitNP.cc MACRelayUnitNP_n.cc MACRelayUnitPP.cc \
	 MACRelayUnitPP_n.cc MACRelayUnit_n.cc Networks_n.cc eth-index_n.cc \
	 utils.cc libs/cmdenv/cmdenv.cc libs/cmdenv/enumstr.cc \
	 libs/cmdenv/heap.cc libs/envir/akoutvectormgr.cc libs/envir/args.cc \
	 libs/envir/cenvir.cc libs/envir/cinifile.cc libs/envir/filemgrs.cc \
	 libs/envir/main.cc libs/envir/omnetapp.cc libs/envir/patmatch.cc \
	 libs/envir/platdep.cc libs/envir/seeds.cc libs/envir/slaveapp.cc \
	 libs/envir/speedmtr.cc libs/sim/carray.cc libs/sim/cexception.cc \
	 libs/sim/cmessage.cc libs/sim/cpar.cc libs/sim/ctypes.cc \
	 libs/sim/task.cc libs/sim/cchannel.cc libs/sim/cfsm.cc \
	 libs/sim/cmodule.cc libs/sim/cpsquare.cc libs/sim/cvarhist.cc \
	 libs/sim/util.cc libs/sim/ccoroutine.cc libs/sim/cgate.cc \
	 libs/sim/cmsgheap.cc libs/sim/cqueue.cc libs/sim/cwatch.cc \
	 libs/sim/cdensity.cc libs/sim/chead.cc libs/sim/cnetmod.cc \
	 libs/sim/csimul.cc libs/sim/distrib.cc libs/sim/cdetect.cc \
	 libs/sim/chist.cc libs/sim/cobject.cc libs/sim/cstat.cc \
	 libs/sim/errmsg.cc libs/sim/cdispstr.cc libs/sim/cksplit.cc \
	 libs/sim/coutvect.cc libs/sim/cstruct.cc libs/sim/onstartup.cc \
	 libs/sim/cenum.cc libs/sim/cllist.cc libs/sim/cpacket.cc \
	 libs/sim/ctopo.cc libs/sim/random.cc libs/sim/std/netpack.cc \
	 libs/spec/spec_qsort.cc)
CFLAGS += -I$(abspath ./src) -I$(abspath ./src/omnet_include) -I$(abspath ./src/libs/envir)
LD_CXX = 1
include ../Makefile.apps
include ../Makefile.run

test-cmp: run
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, $(RUN_DIR)/omnetpp.log, data/test/output/omnetpp.log)
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, $(RUN_DIR)/omnetpp.sca, data/test/output/omnetpp.sca)

train-cmp: run
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, $(RUN_DIR)/omnetpp.log, data/train/output/omnetpp.log)
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, $(RUN_DIR)/omnetpp.sca, data/train/output/omnetpp.sca)

ref-cmp: run
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, $(RUN_DIR)/omnetpp.log, data/ref/output/omnetpp.log)
	$(call SPECDIFF, --abstol 1e-06  --reltol 1e-05, $(RUN_DIR)/omnetpp.sca, data/ref/output/omnetpp.sca)
include Makefile.deps
