.PHONY: default
default: compile

.PHONY: compile
compile:
	mix compile --force --warnings-as-errors

.PHONY: install
install:
	mix do archive.build, archive.install

.PHONY: uninstall
uninstall:
	mix archive.uninstall scaffold-0.1.0
