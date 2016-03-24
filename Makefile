.DEFAULT_GOAL := stub
bindir ?= ./build/bin
libdir ?= ./build/lib
logdir ?= ./build/var/log
tmpdir ?= ./build/var/tmp
uname := $(shell uname -s)

clean: | uninstall

install: | stub
	@rsync -a src/bin/ ${bindir}/
	@rsync -a src/lib/ ${libdir}/
ifeq (${uname}, Darwin)
	@$(eval _bindir := $(shell greadlink -f ${bindir}))
	@$(eval _libdir := $(shell greadlink -f ${libdir}))
	@$(eval _logdir := $(shell greadlink -f ${logdir}))
	@$(eval _tmpdir := $(shell greadlink -f ${tmpdir}))
	@sed -i '' "s|bindir=|bindir=${_bindir}|g" ${bindir}/hykes-engine
	@sed -i '' "s|libdir=|libdir=${_libdir}|g" ${bindir}/hykes-engine
	@sed -i '' "s|logdir=|logdir=${_logdir}|g" ${bindir}/hykes-engine
	@sed -i '' "s|tmpdir=|tmpdir=${_tmpdir}|g" ${bindir}/hykes-engine
else ifeq (${uname}, Linux)
	@$(eval _bindir := $(shell readlink -f ${bindir}))
	@$(eval _libdir := $(shell readlink -f ${libdir}))
	@$(eval _logdir := $(shell readlink -f ${logdir}))
	@$(eval _tmpdir := $(shell readlink -f ${tmpdir}))
	@sed -i "s|sed -i ''|sed -i|g" ${bindir}/hykes-engine
	@sed -i "s|bindir=|bindir=${_bindir}|g" ${bindir}/hykes-engine
	@sed -i "s|libdir=|libdir=${_libdir}|g" ${bindir}/hykes-engine
	@sed -i "s|logdir=|logdir=${_logdir}|g" ${bindir}/hykes-engine
	@sed -i "s|tmpdir=|tmpdir=${_tmpdir}|g" ${bindir}/hykes-engine
endif

stub:
	@mkdir -p ${bindir}
	@mkdir -p ${libdir}
	@mkdir -p ${logdir}
	@mkdir -p ${tmpdir}

test: | test-unit test-integration

test-integration: | install
	@bats test/integration

test-unit: | install
	@bats test/unit

uninstall:
	@rm -rf ${bindir}
	@rm -rf ${libdir}
	@rm -rf ${logdir}
	@rm -rf ${tmpdir}

.PHONY: clean install stub test test-integration test-unit uninstall
