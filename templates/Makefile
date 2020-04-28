.PHONY: default
default: build

.PHONY: check_deps
check_deps:
	if [ ! -d deps ]; then mix deps.get; fi

.PHONY: client
client:
	make -C ./client

.PHONY: build_client_if_missing
build_client_if_missing:
	if [ ! -d ./client/dist/<%= app_module %>/ ]; then make client; fi;

.PHONY: build
build: check_deps build_client_if_missing 
	mix compile --force --warnings-as-errors

.PHONY: run
run: build
	iex -S mix

.PHONY: clean
clean:
	rm _build/ -rf || true

.PHONY: clean_deps
clean_deps:
	rm deps/ -rf || true

.PHONY: clean_client
clean_client:
	make -C ./client deep_clean

.PHONY: deep_clean
deep_clean: clean clean_deps clean_client

.PHONY: test
test: check_deps
	mix test --trace

.PHONY: release
release: build
	MIX_ENV=prod mix release

.PHONY: docker
docker:
	docker build -t <%= app_name %> .

.PHONY: docker_run
docker_run:
	docker run \
		-p 5000:4040 \
		--name <%= app_name %> \
		-d \
		-t <%= app_name %> 

.PHONY: ignore
ignore:
	find deps/ > .ignore || true
	find doc/ >> .ignore || true
	find _build/ >> .ignore || true
	find priv/generated/ >> .ignore || true
