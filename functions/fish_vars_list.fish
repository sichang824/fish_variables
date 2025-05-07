function fish_vars_list --description "List potentially duplicated variables"
    echo "Checking all user variables for duplicate definitions..."
    echo "=========================="
    
    set -l has_duplicates false
    set -l all_vars (set -n)
    
    for var_name in $all_vars
        # Skip internal and private variables
        if string match -q "_*" -- $var_name
            continue
        end
        
        # Get variable values
        set -l values (__fish_vars_utils_get_variable_info $var_name)
        
        # Check if there are multiple values
        if test (count $values) -gt 1
            echo "Variable: $var_name"
            echo "  Status: Duplicate definition ($(count $values) values)"
            echo "  Current values: $values"
            echo ""
            set has_duplicates true
        end
    end
    
    if test "$has_duplicates" = "false"
        echo "No duplicate variables found!"
    else
        echo "Use 'fish_vars fix <variable_name> <value>' to fix these issues"
    end
end