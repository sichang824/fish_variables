# Fish Variables API Documentation

This document describes the functions and their parameters for the Fish Variables Management Tool.

## Main Functions

### fish_vars

The main function that handles all operations.

```fish
function fish_vars
    # Parameters:
    # [command]: The operation to perform (check, fix, list, export, help)
    # [arguments...]: Additional arguments specific to each command
    
    # Description:
    # Entry point for all operations in the Fish Variables Management Tool
end
```

### fish_vars_check

Checks variables against expected values.

```fish
function fish_vars_check
    # Parameters:
    # --file FILE_PATH: Path to configuration file
    # or
    # VARIABLE_NAME EXPECTED_VALUE: Single variable check
    
    # Returns:
    # 0 if all variables match expected values
    # 1 if any variable doesn't match or is duplicated
end
```

### fish_vars_fix

Fixes variables by removing duplicates and setting correct values.

```fish
function fish_vars_fix
    # Parameters:
    # --file FILE_PATH: Path to configuration file
    # or
    # VARIABLE_NAME CORRECT_VALUE: Single variable fix
    
    # Returns:
    # 0 if all variables were successfully fixed
    # Non-zero if any error occurred
end
```

### fish_vars_list

Lists all duplicate variables.

```fish
function fish_vars_list
    # No parameters
    
    # Output:
    # List of duplicate variables with their values
end
```

### fish_vars_export

Exports recommended configuration to a file.

```fish
function fish_vars_export
    # Parameters:
    # [OUTPUT_FILE_PATH]: Optional path to output file
    #                     Defaults to ~/.config/fish/vars.conf
    
    # Returns:
    # 0 if export was successful
    # Non-zero if any error occurred
end
```

## Utility Functions

### __fish_vars_utils_get_variable_info

Gets information about a variable.

```fish
function __fish_vars_utils_get_variable_info
    # Parameters:
    # VARIABLE_NAME: Name of the variable to get information about
    
    # Returns:
    # 0 if the variable exists
    # 1 if the variable doesn't exist
    
    # Output:
    # Values of the variable (one per line)
end
```

### __fish_vars_utils_parse_config_file

Parses a configuration file and yields variable definitions.

```fish
function __fish_vars_utils_parse_config_file
    # Parameters:
    # FILE_PATH: Path to configuration file
    
    # Returns:
    # 0 if parsing was successful
    # 1 if the file doesn't exist or other error
    
    # Output:
    # Variable definitions in a format suitable for processing
end
```

### __fish_vars_utils_print_help

Displays help information.

```fish
function __fish_vars_utils_print_help
    # No parameters
    
    # Output:
    # Help text describing all commands and their usage
end
```

### __fish_vars_check_single_variable

Checks a single variable against expected value.

```fish
function __fish_vars_check_single_variable
    # Parameters:
    # VARIABLE_NAME: Name of the variable to check
    # EXPECTED_VALUE: Expected value of the variable
    
    # Returns:
    # 0 if the variable matches the expected value
    # 1 if the variable doesn't exist
    # 2 if the variable has duplicate definitions
    # 3 if the variable's value doesn't match the expected value
    
    # Output:
    # Status information about the variable
end
```

### __fish_vars_fix_single_variable

Fixes a single variable.

```fish
function __fish_vars_fix_single_variable
    # Parameters:
    # VARIABLE_NAME: Name of the variable to fix
    # CORRECT_VALUE: Correct value for the variable
    
    # Returns:
    # 0 if the fix was successful
    # Non-zero if any error occurred
    
    # Output:
    # Status information about the fix operation
end
```

### __fish_vars_export_create_file

Creates a configuration template file.

```fish
function __fish_vars_export_create_file
    # Parameters:
    # OUTPUT_FILE_PATH: Path to the output file
    
    # Returns:
    # 0 if the file was created successfully
    # Non-zero if any error occurred
end
```

## Configuration File Format

The configuration file uses a simple text format:

```
# Comment line
VARIABLE_NAME VALUE
```

## Return Status Codes

All functions return appropriate status codes:
- 0: Success
- 1: General error or variable not set
- 2: Duplicate variable definitions
- 3: Value mismatch

Error messages are printed to stderr.
