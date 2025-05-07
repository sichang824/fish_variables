# Fish Variables Usage Guide

This document provides detailed instructions on how to use the fish_variables tool.

## Introduction

Fish Variables Management Tool is designed to check and fix Fish shell configuration variables, especially those that are prone to duplicate definitions. When using the `set -U` command multiple times for the same variable, duplicate definitions can occur. This tool helps identify and resolve these issues.

## Commands Overview

### Checking Variables

```fish
# Check a single variable
fish_vars check VARIABLE_NAME EXPECTED_VALUE

# Check multiple variables using a configuration file
fish_vars check --file PATH_TO_CONFIG_FILE
```

When checking variables, the tool will:
1. Verify if the variable exists
2. Check if there are any duplicate definitions
3. Compare the current value with the expected value
4. Report the status and suggested actions

Example output:
```
Checking variable: fish_history_save_on_command
  Status: Duplicate definition (2 values)
  Current values: true false
  Expected value: true
  Action: Needs cleanup and reset
```

### Fixing Variables

```fish
# Fix a single variable
fish_vars fix VARIABLE_NAME CORRECT_VALUE

# Fix multiple variables using a configuration file
fish_vars fix --file PATH_TO_CONFIG_FILE
```

The fix operation will:
1. Check the current status of the variable
2. If the variable has duplicates, remove all instances and set the correct value
3. If the variable has the wrong value, update it to the correct value
4. If the variable doesn't exist, create it with the correct value

Example output:
```
Cleaning up duplicated variable fish_history_save_on_command and resetting to true
```

### Listing Duplicate Variables

```fish
# List all duplicate variables
fish_vars list
```

This command scans all user variables and identifies those with duplicate definitions. It's useful for performing a quick check of your Fish environment.

Example output:
```
Checking all user variables for duplicate definitions...
==========================
Variable: fish_history_save_on_command
  Status: Duplicate definition (2 values)
  Current values: true false

Use 'fish_vars fix <variable_name> <value>' to fix these issues
```

### Exporting Recommended Configuration

```fish
# Export recommended configuration to a file
fish_vars export PATH_TO_OUTPUT_FILE
```

This creates a template configuration file that you can customize for your needs. If no path is specified, it defaults to `~/.config/fish/vars.conf`.

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

Comments start with `#` and are ignored. Empty lines are also ignored.

## Practical Examples

### Example 1: Checking and Fixing a Single Variable

```fish
# Check if the variable is set correctly
fish_vars check fish_history_save_on_command true

# If there's an issue, fix it
fish_vars fix fish_history_save_on_command true
```

### Example 2: Managing Multiple Variables with a Configuration File

```fish
# First, export a template
fish_vars export ~/fish_settings.conf

# Edit the template to add your variables
vim ~/fish_settings.conf

# Check all variables in the file
fish_vars check --file ~/fish_settings.conf

# Fix all variables in the file
fish_vars fix --file ~/fish_settings.conf
```

### Example 3: Finding and Fixing All Duplicate Variables

```fish
# List all duplicate variables
fish_vars list

# For each reported variable, fix it with the correct value
fish_vars fix VARIABLE_NAME CORRECT_VALUE
```

## Troubleshooting

### Common Issues

1. **Duplicate variable definitions**: Use `fish_vars list` to find duplicates and `fish_vars fix` to correct them.

2. **Unexpected variable values**: Use `fish_vars check` to verify variable values match expectations.

3. **Configuration file syntax errors**: Ensure each variable is on its own line with a space between the name and value.

4. **Variable not being fixed**: Make sure you're using the correct variable name and value. Try running the command with `--file` to see detailed output.

## Best Practices

1. Keep a backup of your recommended variables configuration
2. Periodically check for duplicate variables with `fish_vars list`
3. Use configuration files for managing multiple variables
4. Add important variables to your Fish configuration to set them automatically
