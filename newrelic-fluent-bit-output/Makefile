NEWRELIC_PLUGIN_VERSION := 1.12.3

.PHONY: build
build:
	echo $(NEWRELIC_PLUGIN_VERSION)
	wget -Oout_newrelic-linux-amd64.so https://github.com/newrelic/newrelic-fluent-bit-output/releases/download/v$(NEWRELIC_PLUGIN_VERSION)/out_newrelic-linux-amd64-$(NEWRELIC_PLUGIN_VERSION).so
	docker build -tmorawskim/newrelic-fluent-bit-output-build .
	rm -f out_newrelic-linux-amd64.so
