SPECINT = 400.perlbench 401.bzip2 403.gcc 429.mcf 445.gobmk 456.hmmer 458.sjeng 462.libquantum 464.h264ref 471.omnetpp 473.astar 483.xalancbmk

SPECFP = 410.bwaves 416.gamess 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 447.dealII 450.soplex 453.povray 454.calculix 459.GemsFDTD 465.tonto 470.lbm 481.wrf 482.sphinx3

ARCH ?= riscv64
export ARCH

SUBPROCESS_NUM ?= 1

ifeq ($(SPEC_LITE),)
$(error ERROR: enviroment variable SPEC_LITE is not defined)
endif

TIMESTAMP := $(shell date +%Y%m%d_%H%M%S)
ifeq ($(ELF_PATH),)
COPY_DST_PATH := $(CURDIR)/cpu2006_build_$(TIMESTAMP)
else
COPY_DST_PATH := $(CURDIR)/$(ELF_PATH)_$(TIMESTAMP)
endif

.PHONY: check_env_SPEC
check_env_SPEC:
	@if [ -z "$$SPEC" ]; then \
		echo "Error: SPEC enviroment variable is not set."; \
		exit 1; \
	fi

copy_src_%: check_env_SPEC
	@$(MAKE) -s -C $* copy-src

copy_data_%: check_env_SPEC
	@$(MAKE) -s -C $* copy-data

clean_src_%:
	@$(MAKE) -s -C $* clean-src

clean_data_%:
	@$(MAKE) -s -C $* clean-data

clean_build_%:
	@$(MAKE) -s -C $* clean-build

build_int_%:
	@$(MAKE) -s -C $* TESTSET_SPECIFIC_FLAG=-ffp-contract=off -j $(SUBPROCESS_NUM)

build_fp_%:
	@$(MAKE) -s -C $* -j $(SUBPROCESS_NUM)

clean_%:
	@$(MAKE) -s -C $* clean

collect_%:
	@$(MAKE) -s -C $* ELF_PATH=$(COPY_DST_PATH) collect

build-int: $(foreach t,$(SPECINT),build_int_$t)
build-fp: $(foreach t,$(SPECFP),build_fp_$t)
build-all: build-int build-fp

copy-int-src: $(foreach t,$(SPECINT),copy_src_$t)
copy-fp-src: $(foreach t,$(SPECFP),copy_src_$t)
copy-all-src: copy-int-src copy-fp-src

copy-int-data: $(foreach t,$(SPECINT),copy_data_$t)
copy-fp-data: $(foreach t,$(SPECFP),copy_data_$t)
copy-all-data: copy-int-data copy-fp-data

clean-int-src: $(foreach t,$(SPECINT),clean_src_$t)
clean-fp-src: $(foreach t,$(SPECFP),clean_src_$t)
clean-all-src: clean-int-src clean-fp-src

clean-int-data: $(foreach t,$(SPECINT),clean_data_$t)
clean-fp-data: $(foreach t,$(SPECFP),clean_data_$t)
clean-all-data: clean-int-data clean-fp-data

clean-int-build: $(foreach t,$(SPECINT),clean_build_$t)
clean-fp-build: $(foreach t,$(SPECFP),clean_build_$t)
clean-all-build: clean-int-build clean-fp-build

collect-int: $(foreach t,$(SPECINT),collect_$t)
collect-fp: $(foreach t,$(SPECFP),collect_$t)
collect-all: collect-fp collect-int

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
