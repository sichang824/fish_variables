# Fish Variables Management Tool

This Fisher plugin is designed to check and fix Fish shell configuration variables, especially those prone to duplicate definitions.

## Features

- Check for duplicate variable definitions
- Verify variable values against expected values
- Fix variable issues (remove duplicates and set correct values)
- List all duplicate variables
- Export recommended configuration to a file

## Installation

Install using Fisher:

```fish
fisher install username/fish_variables
```

## Usage

### Check a Single Variable

```fish
# Check a single variable
fish_vars check fish_history_save_on_command true
```

### Check Multiple Variables Using a Configuration File

```fish
# First export a configuration template
fish_vars export ~/my_vars.conf

# Edit the configuration file
vim ~/my_vars.conf

# Check variables using the configuration file
fish_vars check --file ~/my_vars.conf
```

### Fix Variables

```fish
# Fix a single variable
fish_vars fix sponge_purge_only_on_exit true

# Fix multiple variables using a configuration file
fish_vars fix --file ~/my_vars.conf
```

### Find Duplicate Variables

```fish
# List all duplicate variables
fish_vars list
```

### Get Help

```fish
fish_vars help
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

## Common Issues

### Fixing Duplicate Variables

Duplicate variables typically occur from multiple uses of the `set -U` command for the same variable. Use `fish_vars list` to find these variables, then fix them with the `fish_vars fix` command:

```fish
fish_vars fix VARIABLE_NAME VALUE
```

### Using Recommended Configuration

You can export recommended configuration with the `export` command, then modify as needed:

```fish
fish_vars export ~/.config/fish/recommended_vars.conf
```

## Customization

You can add more variables to the configuration file or use command line arguments directly:

```fish
fish_vars check CUSTOM_VARIABLE_NAME EXPECTED_VALUE
```
