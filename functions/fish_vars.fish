function fish_vars --description "Fish Variables Management Tool"
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
                fish_vars_fix $argv[2..-1]
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
        case "*"
            echo "Unknown command: $cmd"
            echo "Run 'fish_vars help' for help"
    end
end