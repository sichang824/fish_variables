function __fish_vars_utils_get_variable_info --description "Get information about a variable"
    set -l var_name $argv[1]
    
    # Get variable definition information
    set -l var_info (set -S $var_name 2>/dev/null)
    
    # Check if variable exists
    if test -z "$var_info"
        return 1
    end
    
    # Extract variable values
    set -l values
    for line in $var_info
        if string match -q "*\[$var_name\]*: |*|*" -- $line
            set -a values (string replace -r ".*: \|(.*)\|.*" '$1' -- $line)
        end
    end
    
    # Return the values
    for val in $values
        echo $val
    end
    
    return 0
end

function __fish_vars_utils_parse_config_file --description "Parse a configuration file and yield variable definitions"
    set -l config_file $argv[1]
    
    if not test -f $config_file
        echo "Error: Configuration file not found: $config_file" >&2
        return 1
    end
    
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
        
        # Output the variable name and value
        echo "$var_name"
        for val in $var_value
            echo "$val"
        end
        echo "--SEPARATOR--"  # Use a separator that's unlikely to be in the variable name or value
    end
    
    return 0
end

function __fish_vars_utils_print_help --description "Display help information"
    echo "Fish Variables Management Tool"
    echo "Usage: fish_vars [command] [arguments...]"
    echo ""
    echo "Commands:"
    echo "  check                  Check all variables, list duplicates"
    echo "  check [var_name] [val] Check specific variable status"
    echo "  check --file [path]    Check variables using a config file"
    echo "  fix [var_name] [val]   Fix specific variable"
    echo "  fix --file [path]      Fix variables using a config file"
    echo "  list                   List potentially duplicated variables (same as check without args)"
    echo "  export [file_path]     Export recommended configuration to a file"
    echo "  help                   Display this help information"
    echo ""
    echo "Examples:"
    echo "  fish_vars check        # Check all variables, list duplicates"
    echo "  fish_vars check fish_history_save_on_command true"
    echo "  fish_vars fix sponge_purge_only_on_exit true"
    echo "  fish_vars check --file ~/.config/fish/vars.conf"
end
