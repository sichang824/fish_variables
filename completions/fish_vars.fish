# Define completions for the fish_vars command
complete -c fish_vars -f
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "check" -d "Check variable status"
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "fix" -d "Fix variable issues"
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "list" -d "List potentially duplicated variables"
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "export" -d "Export recommended configuration"
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "help" -d "Display help information"

# File arguments for check and fix
complete -c fish_vars -n "__fish_seen_subcommand_from check fix" -l file -r -d "Use configuration file"

# Suggest common Fish variables
complete -c fish_vars -n "__fish_seen_subcommand_from check fix; and not __fish_seen_argument -l file" \
    -a "fish_history_save_on_command" -d "Whether to save history immediately"
complete -c fish_vars -n "__fish_seen_subcommand_from check fix; and not __fish_seen_argument -l file" \
    -a "fish_history_ignore_failures" -d "Whether to ignore failed commands"
complete -c fish_vars -n "__fish_seen_subcommand_from check fix; and not __fish_seen_argument -l file" \
    -a "sponge_purge_only_on_exit" -d "Whether to clean history only on exit"