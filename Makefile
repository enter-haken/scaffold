.PHONY: default
default: compile

.PHONY: compile
compile:
	mix compile --force --warnings-as-errors

.PHONY: install
install: clean
	mix do archive.build, archive.install

.PHONY: uninstall
uninstall:
	mix archive.uninstall scaffold-0.1.0

.PHONY: clean
clean:
	rm scaffold-0.1.0.ez || true
	rm _build -rf || true
