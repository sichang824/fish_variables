.PHONY: install test clean help

# Default target
.DEFAULT_GOAL := help

# Project variables
FISHER_PATH := ~/.config/fish/fisher
FUNCTIONS_DIR := functions
COMPLETIONS_DIR := completions
CONF_DIR := conf.d

help:
	@echo "Fish Variables Management Tool"
	@echo ""
	@echo "Usage:"
	@echo "  make install    Install the plugin locally"
	@echo "  make test       Run tests"
	@echo "  make clean      Clean temporary files"
	@echo "  make help       Show this help message"

install:
	@echo "Installing fish_variables to $(FISHER_PATH)..."
	@mkdir -p $(FISHER_PATH)/functions $(FISHER_PATH)/completions $(FISHER_PATH)/conf.d
	@cp -f $(FUNCTIONS_DIR)/*.fish $(FISHER_PATH)/functions/
	@cp -f $(COMPLETIONS_DIR)/*.fish $(FISHER_PATH)/completions/ 2>/dev/null || true
	@cp -f $(CONF_DIR)/*.fish $(FISHER_PATH)/conf.d/ 2>/dev/null || true
	@echo "Installation complete"

test:
	@echo "Running tests..."
	# Add your test commands here
	@echo "Tests completed"

clean:
	@echo "Cleaning temporary files..."
	@find . -name "*~" -delete
	@find . -name "*.bak" -delete
	@echo "Clean complete"
