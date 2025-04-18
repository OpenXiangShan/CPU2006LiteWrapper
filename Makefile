SPECINT = 400.perlbench 401.bzip2 403.gcc 429.mcf 445.gobmk 456.hmmer 458.sjeng 462.libquantum 464.h264ref 471.omnetpp 473.astar 483.xalancbmk

SPECFP = 410.bwaves 416.gamess 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 447.dealII 450.soplex 453.povray 454.calculix 459.GemsFDTD 465.tonto 470.lbm 481.wrf 482.sphinx3

ARCH ?= $(shell uname -m)
export ARCH

SPEC_LITE ?= $(CURDIR)
export SPEC_LITE

TIMESTAMP := $(shell date +%Y%m%d_%H%M%S)
ifeq ($(ELF_PATH),)
COPY_DST_PATH := $(CURDIR)/cpu2006_build_$(TIMESTAMP)
else
COPY_DST_PATH := $(CURDIR)/$(ELF_PATH)_$(TIMESTAMP)
endif

create_log_dir = @mkdir -p $*/logs

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

clean_logs_%:
	@$(MAKE) -s -C $* clean-logs

clean_pgo_%:
	@$(MAKE) -s -C $* clean-pgo

clean_obj_%:
	@$(MAKE) -C $* clean-obj

clean_all_%:
	@$(MAKE) -s -C $* clean-all

build_intpgo_%:
	@$(call create_log_dir)
	@$(MAKE) -s -C $* clean-obj
	@mkdir -p $(CURDIR)/$*/pgo
	@$(MAKE) -s -C $* TESTSET_SPECIFIC_FLAG=-ffp-contract=off PGO_FLAG=-fprofile-generate=$(CURDIR)/$*/pgo >> $*/logs/profilebuild_int_$*_$(TIMESTAMP).log 2>&1
	@echo "Build INT PGO generator: $*"
	@$(MAKE) run-$*-train >> $*/logs/pgorun_int_$*_$(TIMESTAMP).log 2>&1
	@echo "Train INT PGO target: $*"
	@$(MAKE) -s -C $* clean-obj
	@$(MAKE) -s -C $* TESTSET_SPECIFIC_FLAG=-ffp-contract=off PGO_FLAG=-fprofile-use=$(CURDIR)/$*/pgo >> $*/logs/pgobuild_int_$*_$(TIMESTAMP).log 2>&1
	@echo "Build INT PGO target: $*"

build_int_%:
	@$(call create_log_dir)
	@$(MAKE) -s -C $* TESTSET_SPECIFIC_FLAG=-ffp-contract=off >> $*/logs/build_int_$*_$(TIMESTAMP).log 2>&1
	@echo "Build INT target: $*"

build_fppgo_%:
	@$(call create_log_dir)
	@$(MAKE) -s -C $* clean-obj
	@mkdir -p $(CURDIR)/$*/pgo
	@$(MAKE) -s -C $* PGO_FLAG=-fprofile-generate=$(CURDIR)/$*/pgo >> $*/logs/profilebuild_fp_$*_$(TIMESTAMP).log 2>&1
	@echo "Build FP PGO generator: $*"
	@$(MAKE) run-$*-train >> $*/logs/pgorun_fp_$*_$(TIMESTAMP).log 2>&1
	@echo "Train FP PGO target: $*"
	@$(MAKE) -s -C $* clean-obj
	@$(MAKE) -s -C $* PGO_FLAG=-fprofile-use=$(CURDIR)/$*/pgo >> $*/logs/pgobuild_fp_$*_$(TIMESTAMP).log 2>&1
	@echo "Build FP PGO target: $*"

build_fp_%:
	@$(call create_log_dir)
	@$(MAKE) -s -C $* >> $*/logs/build_fp_$*_$(TIMESTAMP).log 2>&1
	@echo "Build FP target: $*"

collect_%:
	@$(MAKE) -s -C $* ELF_PATH=$(COPY_DST_PATH) collect

apply_%:
	@$(MAKE) -s -C $* ELF_PATH=$(ELF_PATH) apply-elf

copy-int-src: $(foreach t,$(SPECINT),copy_src_$t)
copy-fp-src: $(foreach t,$(SPECFP),copy_src_$t)
copy-all-src: copy-int-src copy-fp-src

copy-int-data: $(foreach t,$(SPECINT),copy_data_$t)
copy-fp-data: $(foreach t,$(SPECFP),copy_data_$t)
copy-all-data: copy-int-data copy-fp-data

build-int: $(foreach t,$(SPECINT),build_int_$t)
build-fp: $(foreach t,$(SPECFP),build_fp_$t)
build-intpgo: $(foreach t,$(SPECINT),build_intpgo_$t)
build-fppgo: $(foreach t,$(SPECFP),build_fppgo_$t)
build-all: build-int build-fp
build-allpgo: build-intpgo build-fppgo

clean-int-src: $(foreach t,$(SPECINT),clean_src_$t)
clean-fp-src: $(foreach t,$(SPECFP),clean_src_$t)
clean-all-src: clean-int-src clean-fp-src

clean-int-data: $(foreach t,$(SPECINT),clean_data_$t)
clean-fp-data: $(foreach t,$(SPECFP),clean_data_$t)
clean-all-data: clean-int-data clean-fp-data

clean-int-build: $(foreach t,$(SPECINT),clean_build_$t)
clean-fp-build: $(foreach t,$(SPECFP),clean_build_$t)
clean-all-build: clean-int-build clean-fp-build

clean-int-obj: $(foreach t,$(SPECINT),clean_obj_$t)
clean-fp-obj: $(foreach t,$(SPECFP),clean_obj_$t)
clean-all-obj: clean-int-obj clean-fp-obj

clean-int-logs: $(foreach t,$(SPECINT),clean_logs_$t)
clean-fp-logs: $(foreach t,$(SPECFP),clean_logs_$t)
clean-all-logs: clean-int-logs clean-fp-logs

clean-int-all: $(foreach t,$(SPECINT),clean_all_$t)
clean-fp-all: $(foreach t,$(SPECFP),clean_all_$t)
clean-all: clean-fp-all clean-int-all

collect-int: $(foreach t,$(SPECINT),collect_$t)
collect-fp: $(foreach t,$(SPECFP),collect_$t)
collect-all: collect-fp collect-int

apply-elf-int: $(foreach t,$(SPECINT),apply_$t)
apply-elf-fp: $(foreach t,$(SPECFP),apply_$t)
apply-elf-all: apply-elf-fp apply-elf-int

# prototype: cmd_template(size)
define cmd_template
run-int-$(1): $(foreach t,$(SPECINT),run-$t-$(1))
	@echo "\n\n\n"
	$(MAKE) report-int-$(1)

validate-int-$(1):
	for t in $$(SPECINT); do $(MAKE) -s -C $$$$t $(1)-cmp; done

backup_int_$(1): $(foreach t,$(SPECINT),backup-$t-$(1))

run-fp-$(1): $(foreach t,$(SPECFP),run-$t-$(1))
	@echo "\n\n\n"
	$(MAKE) report-fp-$(1)

run-all-$(1): $(foreach t,$(SPECINT) $(SPECFP),run-$t-$(1))
	@echo "\n\n\n"
	$(MAKE) report-int-$(1)
	$(MAKE) report-fp-$(1)

validate-fp-$(1):
	for t in $$(SPECFP); do $(MAKE) -s -C $$$$t $(1)-cmp; done

backup_fp_$(1): $(foreach t,$(SPECFP),backup-$t-$(1))

backup_all_$(1): $(foreach t,$(SPECINT) $(SPECFP),backup-$t-$(1))

run-%-$(1):
	@echo "Running $$* [$(1)]..."
	@-$(MAKE) -s -C $$* run TYPE=$(1) > $$*/build/run-$(1).log 2>&1
	@-$(MAKE) -s -C $$* $(1)-cmp

backup-%-$(1):
	@echo "Backup $(1) on $$*"
	@-$(MAKE) -s -C $$* run_result_backup TYPE=$(1)

report-int-$(1):
	@python scripts/report.py --input $(1) --spec int

report-fp-$(1):
	@python scripts/report.py --input $(1) --spec fp

endef

$(eval $(foreach size,test train ref,$(call cmd_template,$(size))))
