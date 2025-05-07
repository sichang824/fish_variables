function fish_vars_export --description "Export recommended configuration"
    set -l output_file "/Users/ann/.config/fish/vars.conf"
    
    if test (count $argv) -gt 0
        set output_file $argv[1]
    end
    
    __fish_vars_export_create_file $output_file
    
    echo "Empty configuration template exported to: $output_file"
    echo "Please edit this file to add variables you want to manage"
end

function __fish_vars_export_create_file --description "Create configuration template file"
    set -l output_file $argv[1]
    
    # Create configuration file with header
    echo "# Fish Variables Configuration File" > $output_file
    echo "# Auto-generated on "(date) >> $output_file
    echo "# Usage: fish_vars check --file $output_file" >> $output_file
    echo "# Or: fish_vars fix --file $output_file" >> $output_file
    echo "" >> $output_file
    
    # Add configuration examples
    echo "# Configuration examples (please modify as needed)" >> $output_file
    echo "# variable_name value" >> $output_file
    echo "" >> $output_file
    echo "# Examples:" >> $output_file
    echo "# fish_history_save_on_command true" >> $output_file
    echo "# fish_history_ignore_failures false" >> $output_file
    echo "# sponge_purge_only_on_exit true" >> $output_file
    
    return 0
end