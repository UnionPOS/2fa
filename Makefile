-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/unionpos/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

bootstrap: init packages
.PHONY: bootstrap

packages: packages/install \
	packages/install/goreleaser
.PHONY: packages

## clean and install latest build harness code
update: down
	make clean-build-harness
	git pull
	make bootstrap
.PHONY: update
