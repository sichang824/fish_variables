function fish_vars_fix --description "Fix Fish variable issues"
    if test (count $argv) -eq 0
        echo "Please specify the variable to fix and its value"
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
        
        # Read the configuration file line by line
        for line in (cat $config_file)
            # Skip comments and empty lines
            if string match -q "#*" -- $line; or test -z (string trim $line)
                continue
            end
            
            # Split variable name and value
            set -l parts (string split " " $line)
            set -l var_name $parts[1]
            set -l var_value $parts[2..-1]
            
            # Fix the variable
            __fish_vars_fix_variable $var_name $var_value
        end
        
        echo "Fix complete!"
    else
        # Directly process command line arguments
        if test (count $argv) -lt 2
            echo "Please provide variable name and expected value"
            return 1
        end
        
        set -l var_name $argv[1]
        set -l var_value $argv[2..-1]
        
        __fish_vars_fix_variable $var_name $var_value
    end
end

function __fish_vars_fix_variable
    set -l var_name $argv[1]
    set -l expected_value $argv[2..-1]
    
    # Check variable status
    __fish_vars_check_variable $var_name $expected_value
    set -l status_code $status
    
    switch $status_code
        case 0
            echo "Variable $var_name is already in good condition, no fix needed"
        case 1
            echo "Setting variable $var_name to $expected_value"
            set -U $var_name $expected_value
        case 2
            echo "Cleaning up duplicated variable $var_name and resetting to $expected_value"
            set -e $var_name
            set -U $var_name $expected_value
        case 3
            echo "Updating variable $var_name to $expected_value"
            set -U $var_name $expected_value
    end
    echo ""
end