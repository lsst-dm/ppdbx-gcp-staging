.PHONY: build-container build-flex-template deploy-function destroy print-logs print-env help deploy-all

define exec
	@echo "Executing $@ ..."
	$1
	@echo "Done executing $@"
endef

deploy-all: build-container build-flex-template deploy-function

help:
	@echo "Available Make targets:"
	@echo "  build-container      Build and push the container to GCR"
	@echo "  build-flex-template  Build the Flex template"
	@echo "  deploy-function      Deploy the function"
	@echo "  deploy-all           Redeploy the container, function, and Flex template"
	@echo "  destroy              Tear down the function"
	@echo "  print-env            Print the deployed function's environment variables"
	@echo "  print-logs           Print the last 50 logs for the function"
	@echo "  help                 Show this help message"

build-container:
	$(call exec,./build-container.sh)

build-flex-template:
	$(call exec,./build-flex-template.sh)

deploy-function:
	$(call exec,./deploy-function.sh)

destroy:
	$(call exec,./destroy.sh)

print-logs:
	$(call exec,./print-logs.sh)

print-env:
	$(call exec,./print-env.sh)
