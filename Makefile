include common.mk

.PHONY: help create get run_chrome run_linux build

help:
	@echo "Available targets:"
	@echo "  create      - Run flutter create ."
	@echo "  get         - Run flutter pub get"
	@echo "  run_chrome  - Run on Chrome"
	@echo "  run_linux   - Run on Linux"
	@echo "  build       - Build the project (default: web)"

create:
	$(FLUTTER) create .

get:
	$(FLUTTER) pub get

run_chrome:
	$(FLUTTER) run -d $(CHROME)

run_linux:
	$(FLUTTER) run -d $(LINUX)

build:
	$(FLUTTER) build web
