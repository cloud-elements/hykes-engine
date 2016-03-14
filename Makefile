.DEFAULT_GOAL := stub
bindir ?= ./build/bin
libdir ?= ./build/lib
uname := $(shell uname -s)

clean: | uninstall

install: | stub
	@rsync -a src/bin/ ${bindir}/
	@rsync -a src/lib/ ${libdir}/
ifeq (${uname}, Darwin)
	@$(eval _bindir := $(shell greadlink -f ${bindir}))
	@$(eval _libdir := $(shell greadlink -f ${libdir}))
	@sed -i '' "s|bindir=|bindir=${_bindir}|g" ${bindir}/hykes-engine
	@sed -i '' "s|libdir=|libdir=${_libdir}|g" ${bindir}/hykes-engine
else ifeq (${uname}, Linux)
	@$(eval _bindir := $(shell readlink -f ${bindir}))
	@$(eval _libdir := $(shell readlink -f ${libdir}))
	@sed -i "s|sed -i ''|sed -i|g" ${bindir}/hykes-engine
	@sed -i "s|bindir=|bindir=${_bindir}|g" ${bindir}/hykes-engine
	@sed -i "s|libdir=|libdir=${_libdir}|g" ${bindir}/hykes-engine
endif

stub:
	@mkdir -p ${bindir}
	@mkdir -p ${libdir}

test: | test-unit test-integration

test-integration: | install
	@bats \
		test/integration/init.bats \
		test/integration/key.bats \
		test/integration/build.bats

test-unit: | install
	@bats test/unit

uninstall:
	@rm -rf ${bindir}
	@rm -rf ${libdir}

.PHONY: clean install stub test test-integration test-unit uninstall
