# Fish Variables Usage Guide

This document provides detailed instructions on how to use the fish_variables tool.

## Introduction

Fish Variables Management Tool is designed to check and fix Fish shell configuration variables, especially those that are prone to duplicate definitions.

## Commands Overview

### Checking Variables

```fish
# Check a single variable
fish_vars check VARIABLE_NAME EXPECTED_VALUE

# Check multiple variables using a configuration file
fish_vars check --file PATH_TO_CONFIG_FILE
```

### Fixing Variables

```fish
# Fix a single variable
fish_vars fix VARIABLE_NAME CORRECT_VALUE

# Fix multiple variables using a configuration file
fish_vars fix --file PATH_TO_CONFIG_FILE
```

### Listing Duplicate Variables

```fish
# List all duplicate variables
fish_vars list
```

### Exporting Recommended Configuration

```fish
# Export recommended configuration to a file
fish_vars export PATH_TO_OUTPUT_FILE
```

## Configuration File Format

The configuration file uses a simple text format with one variable definition per line:

```
# This is a comment
VARIABLE_NAME VALUE
```

Example:

```
# Fish history settings
fish_history_save_on_command true
fish_history_ignore_failures false

# Sponge plugin settings
sponge_purge_only_on_exit true
sponge_filters sponge_filter_failed sponge_filter_matched
```

## Troubleshooting

### Common Issues

1. **Duplicate variable definitions**: Use `fish_vars list` to find duplicates and `fish_vars fix` to correct them.

2. **Unexpected variable values**: Use `fish_vars check` to verify variable values match expectations.

3. **Configuration file syntax errors**: Ensure each variable is on its own line with a space between the name and value.

## Best Practices

1. Keep a backup of your recommended variables configuration
2. Periodically check for duplicate variables
3. Use configuration files for managing multiple variables
