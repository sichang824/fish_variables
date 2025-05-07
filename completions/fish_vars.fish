# 定义 fish_vars 命令的自动完成
complete -c fish_vars -f
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "check" -d "检查变量状态"
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "fix" -d "修复变量问题"
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "list" -d "列出可能重复定义的变量"
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "export" -d "导出推荐配置"
complete -c fish_vars -n "not __fish_seen_subcommand_from check fix list export help" -a "help" -d "显示帮助信息"

# check 和 fix 的文件参数
complete -c fish_vars -n "__fish_seen_subcommand_from check fix" -l file -r -d "使用配置文件"

# 对于通用的 Fish 变量，提供一些建议
complete -c fish_vars -n "__fish_seen_subcommand_from check fix; and not __fish_seen_argument -l file" \
    -a "fish_history_save_on_command" -d "是否立即保存历史记录"
complete -c fish_vars -n "__fish_seen_subcommand_from check fix; and not __fish_seen_argument -l file" \
    -a "fish_history_ignore_failures" -d "是否忽略失败的命令"
complete -c fish_vars -n "__fish_seen_subcommand_from check fix; and not __fish_seen_argument -l file" \
    -a "sponge_purge_only_on_exit" -d "是否仅在退出时清理历史"