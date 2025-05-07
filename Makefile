.PHONY: install uninstall clean help

# Default target
.DEFAULT_GOAL := help

# Project variables
FISHER_PATH := ~/.config/fish
FUNCTIONS_DIR := functions
COMPLETIONS_DIR := completions
CONF_DIR := conf.d

help:
	@echo "Fish Variables Management Tool"
	@echo ""
	@echo "Usage:"
	@echo "  make install    Install the plugin using symbolic links"
	@echo "  make uninstall  Remove symbolic links and clean up"
	@echo "  make clean      Clean temporary files"
	@echo "  make help       Show this help message"

install:
	@echo "Installing fish_variables to $(FISHER_PATH) using symbolic links..."
	@mkdir -p $(FISHER_PATH)/functions $(FISHER_PATH)/completions $(FISHER_PATH)/conf.d
	@echo "Linking function files..."
	@for file in $(FUNCTIONS_DIR)/*.fish; do \
		ln -sf $(PWD)/$$file $(FISHER_PATH)/functions/; \
	done
	@echo "Linking completion files..."
	@for file in $(COMPLETIONS_DIR)/*.fish; do \
		ln -sf $(PWD)/$$file $(FISHER_PATH)/completions/; \
	done
	@echo "Linking configuration files..."
	@for file in $(CONF_DIR)/*.fish; do \
		ln -sf $(PWD)/$$file $(FISHER_PATH)/conf.d/; \
	done
	@echo "Installation complete!"
	@echo ""
	@echo "Please source the fish config file to apply the changes:"
	@echo ""
	@echo "source ~/.config/fish/config.fish"

uninstall:
	@echo "Removing fish_variables symbolic links..."
	@echo "Removing function files..."
	@for file in $(FUNCTIONS_DIR)/*.fish; do \
		filename=$$(basename $$file); \
		if [ -L "$(FISHER_PATH)/functions/$$filename" ]; then \
			rm -f $(FISHER_PATH)/functions/$$filename; \
		fi; \
	done
	@echo "Removing completion files..."
	@for file in $(COMPLETIONS_DIR)/*.fish; do \
		filename=$$(basename $$file); \
		if [ -L "$(FISHER_PATH)/completions/$$filename" ]; then \
			rm -f $(FISHER_PATH)/completions/$$filename; \
		fi; \
	done
	@echo "Removing configuration files..."
	@for file in $(CONF_DIR)/*.fish; do \
		filename=$$(basename $$file); \
		if [ -L "$(FISHER_PATH)/conf.d/$$filename" ]; then \
			rm -f $(FISHER_PATH)/conf.d/$$filename; \
		fi; \
	done
	@echo "Uninstallation complete!"

clean:
	@echo "Cleaning temporary files..."
	@find . -name "*~" -delete
	@find . -name "*.bak" -delete
	@find . -name ".DS_Store" -delete
	@echo "Clean complete!"
