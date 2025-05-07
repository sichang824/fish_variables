function fish_vars_check --description "Check Fish variable status"
    if test (count $argv) -eq 0
        echo "Please specify the variable to check and its expected value"
        return 1
    end
    
    if test "$argv[1]" = "--file"
        if test (count $argv) -lt 2
            echo "Please specify a configuration file path"
            return 1
        end
        
        set -l config_file $argv[2]
        if not test -f $config_file
            echo "Error: Configuration file not found: $config_file"
            return 1
        end
        
        echo "Using configuration file: $config_file"
        echo "=========================="
        
        set -l has_issues false
        
        # Read the configuration file line by line
        # Configuration file format: one variable definition per line, format is "variable_name value"
        # Example: fish_history_save_on_command true
        for line in (cat $config_file)
            # Skip comments and empty lines
            if string match -q "#*" -- $line; or test -z (string trim $line)
                continue
            end
            
            # Split variable name and value
            set -l parts (string split " " $line)
            set -l var_name $parts[1]
            set -l var_value $parts[2..-1]
            
            # Check the variable
            __fish_vars_check_variable $var_name $var_value
            if test $status -ne 0
                set has_issues true
            end
        end
        
        if test "$has_issues" = "true"
            echo "Issues detected, run 'fish_vars fix --file $config_file' to fix these issues"
            return 1
        else
            echo "All variables are in good condition!"
            return 0
        end
    else
        # Directly process command line arguments
        if test (count $argv) -lt 2
            echo "Please provide variable name and expected value"
            return 1
        end
        
        set -l var_name $argv[1]
        set -l var_value $argv[2..-1]
        
        __fish_vars_check_variable $var_name $var_value
        return $status
    end
end

function __fish_vars_check_variable
    set -l var_name $argv[1]
    set -l expected_value $argv[2..-1]
    
    echo "Checking variable: $var_name"
    
    # Get variable definition information
    set -l var_info (set -S $var_name 2>/dev/null)
    
    # Check if variable exists
    if test -z "$var_info"
        echo "  Status: Not set"
        echo "  Expected value: $expected_value"
        echo "  Action: Needs to be set"
        echo ""
        return 1
    end
    
    # Extract variable values
    set -l values
    for line in $var_info
        if string match -q "*\[$var_name\]*: |*|*" -- $line
            set -a values (string replace -r ".*: \|(.*)\|.*" '$1' -- $line)
        end
    end
    
    # Check if there are multiple values
    if test (count $values) -gt 1
        echo "  Status: Duplicate definition ($(count $values) values)"
        echo "  Current values: $values"
        echo "  Expected value: $expected_value"
        echo "  Action: Needs cleanup and reset"
        echo ""
        return 2
    end
    
    # Check if value matches expected value
    set -l current_value $values[1]
    set -l expected_joined (string join " " $expected_value)
    
    if test "$current_value" != "$expected_joined"
        echo "  Status: Value mismatch"
        echo "  Current value: $current_value"
        echo "  Expected value: $expected_joined"
        echo "  Action: Needs update"
        echo ""
        return 3
    end
    
    echo "  Status: OK"
    echo "  Current value: $current_value"
    echo ""
    return 0
end