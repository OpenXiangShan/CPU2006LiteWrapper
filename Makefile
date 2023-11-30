SPECINT = 400.perlbench 401.bzip2 403.gcc 429.mcf 445.gobmk 456.hmmer 458.sjeng 462.libquantum 464.h264ref 471.omnetpp 473.astar 483.xalancbmk

SPECFP = 410.bwaves 416.gamess 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 447.dealII 450.soplex 453.povray 454.calculix 459.GemsFDTD 465.tonto 470.lbm 481.wrf 482.sphinx3

ARCH ?= x86_64
export ARCH

# Set this variable to the path of SEPC2006 to run the `init` rule for the first time
SPEC =

ifeq ($(SPEC),)
init:
	@echo "ERROR: enviroment variable SPEC is not defined" && false
else
CPU2006_PATH = $(SPEC)/benchspec/CPU2006
init:
	for t in $(SPECINT) $(SPECFP); do cp -r $(CPU2006_PATH)/$$t/data ./$$t/ ; done
	@echo "copy data OK"
endif

build_int_%:
	@$(MAKE) -s -C $* TESTSET_SPECIFIC_FLAG=-ffp-contract=off

build_fp_%:
	@$(MAKE) -s -C $*

clean_int_%:
	@$(MAKE) -s -C $* clean

clean_fp_%:
	@$(MAKE) -s -C $* clean

build-int: $(foreach t,$(SPECINT),build_int_$t)
build-fp: $(foreach t,$(SPECFP),build_int_$t)
build-all: build-int build-fp

clean-int: $(foreach t,$(SPECINT),clean_int_$t)
clean-fp: $(foreach t,$(SPECFP),clean_fp_$t)
clean-all: clean-int clean-fp

# simple source clean
clean-src:
	@find . -name "src" -type d -exec rm -r {}/* \;

# prototype: cmd_template(size)
define cmd_template
run-int-$(1): $(foreach t,$(SPECINT),run-$t-$(1))
	echo "\n\n\n"
	$(MAKE) report-int-$(1)

validate-int-$(1):
	for t in $$(SPECINT); do $$(MAKE) -s -C $$$$t $(1)-cmp; done

run-fp-$(1): $(foreach t,$(SPECFP),run-$t-$(1))
	echo "\n\n\n"
	$(MAKE) report-fp-$(1)

run-all-$(1): $(foreach t,$(SPECINT) $(SPECFP),run-$t-$(1))
	echo "\n\n\n"
	$(MAKE) report-int-$(1)
	$(MAKE) report-fp-$(1)

validate-fp-$(1):
	for t in $$(SPECFP); do $$(MAKE) -s -C $$$$t $(1)-cmp; done

run-%-$(1):
	@$$(MAKE) -s -C $$* run-$(1) > $$*/build/run-$(1).log

report-int-$(1):
	for t in $$(SPECINT); do cat $$$$t/run/run-$(1).sh.timelog; echo ""; done
	for t in $$(SPECINT); do cat $$$$t/run/run-$(1).sh.timelog | grep "# elapsed in second" | sed -e "s/#.*/\t$$$$t/"; done

report-fp-$(1):
	for t in $$(SPECFP); do cat $$$$t/run/run-$(1).sh.timelog; echo ""; done
	for t in $$(SPECFP); do cat $$$$t/run/run-$(1).sh.timelog | grep "# elapsed in second" | sed -e "s/#.*/\t$$$$t/"; done

endef

$(eval $(foreach size,test train ref,$(call cmd_template,$(size))))
