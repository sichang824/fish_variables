# Fish Variables API Documentation

This document describes the functions and their parameters for the Fish Variables Management Tool.

## Main Functions

### fish_vars

The main function that handles all operations.

```fish
function fish_vars
    set -l cmd $argv[1]
    set -e argv[1]
    
    switch $cmd
        case check
            fish_vars_check $argv
        case fix
            fish_vars_fix $argv
        case list
            fish_vars_list $argv
        case export
            fish_vars_export $argv
        case help
            __fish_vars_print_help
        case '*'
            echo "Unknown command: $cmd"
            __fish_vars_print_help
            return 1
    end
end
```

### fish_vars_check

Checks variables against expected values.

```fish
function fish_vars_check
    # Parameters:
    # --file FILE_PATH: Path to configuration file
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
    # VARIABLE_NAME CORRECT_VALUE: Single variable fix
    
    # Returns:
    # 0 if all variables were successfully fixed
    # 1 if any error occurred
end
```

### fish_vars_list

Lists all duplicate variables.

```fish
function fish_vars_list
    # Parameters:
    # --verbose: Show detailed information
    
    # Output:
    # List of duplicate variables with their values
end
```

### fish_vars_export

Exports recommended configuration to a file.

```fish
function fish_vars_export
    # Parameters:
    # OUTPUT_FILE_PATH: Path to output file
    
    # Returns:
    # 0 if export was successful
    # 1 if any error occurred
end
```

## Internal Functions

### __fish_vars_print_help

Prints help information.

```fish
function __fish_vars_print_help
    # No parameters
    
    # Output:
    # Help text describing all commands and their usage
end
```

### __fish_vars_parse_config_file

Parses a configuration file.

```fish
function __fish_vars_parse_config_file
    # Parameters:
    # FILE_PATH: Path to configuration file
    
    # Returns:
    # Array of variable names and values
end
```

## Configuration File Format

The configuration file uses a simple text format:

```
# Comment line
VARIABLE_NAME VALUE
```

## Error Handling

All functions return appropriate status codes:
- 0: Success
- 1: Error

Error messages are printed to stderr.
