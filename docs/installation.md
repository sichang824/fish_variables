# Fish Variables Installation Guide

This document provides instructions for installing the Fish Variables Management Tool.

## Prerequisites

- [Fish Shell](https://fishshell.com/) (v3.0.0 or later)
- [Fisher](https://github.com/jorgebucaran/fisher) (plugin manager for Fish)

## Installation Methods

### Using Fisher (Recommended)

The easiest way to install is using Fisher:

```fish
fisher install username/fish_variables
```

Replace `username` with the actual GitHub username where this repository is hosted.

### Using Make (Symbolic Links)

If you've cloned the repository, you can use the included Makefile which creates symbolic links:

```fish
cd path/to/fish_variables
make install
```

This will create symbolic links from the plugin files to your Fish configuration directories, allowing you to make changes to the plugin code that will immediately be available without reinstallation.

### Manual Installation

If you prefer to install manually:

1. Clone the repository:

```fish
git clone https://github.com/username/fish_variables ~/.config/fish/fish_variables
```

2. Create symbolic links:

```fish
# Create symbolic links
ln -s ~/.config/fish/fish_variables/functions/*.fish ~/.config/fish/functions/
ln -s ~/.config/fish/fish_variables/completions/*.fish ~/.config/fish/completions/
ln -s ~/.config/fish/fish_variables/conf.d/*.fish ~/.config/fish/conf.d/
```

## Verifying Installation

To verify the installation:

```fish
fish_vars help
```

You should see the help message with usage instructions.

## Updating

### Using Fisher

```fish
fisher update username/fish_variables
```

### Manual Update

If you installed using symbolic links (via Make or manually), pull the latest changes:

```fish
cd path/to/fish_variables
git pull
```

Since you're using symbolic links, there's no need to reinstall after updating.

## Uninstallation

### Using Fisher

```fish
fisher remove username/fish_variables
```

### Using Make

If you installed using the Makefile:

```fish
cd path/to/fish_variables
make uninstall
```

### Manual Uninstallation

Remove the symbolic links:

```fish
# Remove symlinks
rm ~/.config/fish/functions/fish_vars*.fish
rm ~/.config/fish/completions/fish_vars*.fish
rm ~/.config/fish/conf.d/fish_variables*.fish

# Optionally remove the cloned repository
rm -rf path/to/fish_variables
```

## Troubleshooting

### Common Installation Issues

1. **Function not found**: Ensure the functions are properly installed in your Fish functions directory.

   ```fish
   ls -la ~/.config/fish/functions/fish_vars*.fish
   ```

2. **Broken symbolic links**: If you see errors about broken links, check that your repository path is correct.

   ```fish
   find ~/.config/fish -type l -name "fish_vars*" -exec ls -la {} \;
   ```

3. **Permission issues**: Check file permissions.

   ```fish
   chmod +x path/to/fish_variables/functions/*.fish
   ```

If you encounter any other issues, please open an issue on the GitHub repository.
