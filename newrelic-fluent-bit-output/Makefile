NEWRELIC_PLUGIN_VERSION := 1.12.3

.PHONY: build
build:
	echo $(NEWRELIC_PLUGIN_VERSION)
	git clone https://github.com/newrelic/newrelic-fluent-bit-output.git
	cd newrelic-fluent-bit-output && git checkout -b lastver v$(NEWRELIC_PLUGIN_VERSION)
	cd newrelic-fluent-bit-output && docker run --rm -v$(PWD)/newrelic-fluent-bit-output:/app golang:1-bullseye bash -c 'cd /app && git config --global --add safe.directory /app && make linux/amd64 VERSION=$(NEWRELIC_PLUGIN_VERSION)'
	cd newrelic-fluent-bit-output && mv out_newrelic-linux-amd64-$(NEWRELIC_PLUGIN_VERSION).so ../out_newrelic-linux-amd64.so
	docker build -tmorawskim/newrelic-fluent-bit-output-build .
	rm -f out_newrelic-linux-amd64.so
