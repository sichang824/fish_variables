function fish_vars --description "Fish Variables Management Tool"
    # Source required utility functions
    set -l current_dir (dirname (status -f))
    source "$current_dir/__fish_vars_utils.fish" 2>/dev/null
    source "$current_dir/fish_vars_check.fish" 2>/dev/null
    source "$current_dir/fish_vars_fix.fish" 2>/dev/null
    source "$current_dir/fish_vars_list.fish" 2>/dev/null
    source "$current_dir/fish_vars_export.fish" 2>/dev/null
    
    set -l cmd "check"
    
    if test (count $argv) -gt 0
        set cmd $argv[1]
    end
    
    switch $cmd
        case check
            if test (count $argv) -gt 1
                # If there are additional parameters
                if test "$argv[2]" = "--file"
                    # Handle file mode
                    if test (count $argv) -lt 3
                        echo "Please specify a configuration file path"
                        return 1
                    end
                    fish_vars_check --file $argv[3]
                else
                    # Handle single variable mode
                    fish_vars_check $argv[2..-1]
                end
            else
                # No parameters, check all variables
                fish_vars_list
            end
        case fix
            if test (count $argv) -gt 1
                if test "$argv[2]" = "--file"
                    # Handle file mode
                    if test (count $argv) -lt 3
                        echo "Please specify a configuration file path"
                        return 1
                    end
                    fish_vars_fix --file $argv[3]
                else
                    # Handle single variable mode
                    fish_vars_fix $argv[2..-1]
                end
            else
                echo "Please specify the variable to fix and its value, for example:"
                echo "fish_vars fix fish_history_save_on_command true"
                echo "Or use a configuration file:"
                echo "fish_vars fix --file /path/to/variables.conf"
            end
        case list
            fish_vars_list
        case export
            if test (count $argv) -gt 1
                fish_vars_export $argv[2]
            else
                fish_vars_export
            end
        case help
            __fish_vars_utils_print_help
        case "*"
            echo "Unknown command: $cmd"
            echo "Run 'fish_vars help' for help"
    end
end