# Fish Variables Management Tool Configuration
# This file ensures all functions are loaded in the correct order

# First load utility functions
if test -f "$__fish_config_dir/functions/__fish_vars_utils.fish"
    source "$__fish_config_dir/functions/__fish_vars_utils.fish"
end

# Then load other functions if they exist
set -l function_files fish_vars_check.fish fish_vars_fix.fish fish_vars_list.fish fish_vars_export.fish
for file in $function_files
    if test -f "$__fish_config_dir/functions/$file"
        source "$__fish_config_dir/functions/$file"
    end
end
