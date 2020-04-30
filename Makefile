API_YAML_INPUT  := main.yaml
API_YAML_OUTPUT := swagger-ui/bitwarden.yaml

SOURCES := main.yaml parameters.yaml responses.yaml \
		$(shell find paths schemas -name '*.yaml')

# https://www.npmjs.com/package/yamlinc
$(API_YAML_OUTPUT): $(SOURCES)
	yamlinc --strict --output - $(API_YAML_INPUT) > $(API_YAML_OUTPUT)

publish: $(API_YAML_OUTPUT) swagger-ui/swagger-ui.js
	bin/publish.sh

.PHONY: publish
