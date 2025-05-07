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

### Manual Installation

If you prefer to install manually:

1. Clone the repository:

```fish
git clone https://github.com/username/fish_variables ~/.config/fish/fish_variables
```

2. Create symbolic links or copy files:

```fish
# Option 1: Create symbolic links
ln -s ~/.config/fish/fish_variables/functions/*.fish ~/.config/fish/functions/
ln -s ~/.config/fish/fish_variables/completions/*.fish ~/.config/fish/completions/
ln -s ~/.config/fish/fish_variables/conf.d/*.fish ~/.config/fish/conf.d/

# Option 2: Copy files
cp ~/.config/fish/fish_variables/functions/*.fish ~/.config/fish/functions/
cp ~/.config/fish/fish_variables/completions/*.fish ~/.config/fish/completions/
cp ~/.config/fish/fish_variables/conf.d/*.fish ~/.config/fish/conf.d/
```

### Using Make

If you've cloned the repository, you can use the included Makefile:

```fish
cd path/to/fish_variables
make install
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

If you installed manually, pull the latest changes and copy/link the files again:

```fish
cd ~/.config/fish/fish_variables
git pull
# Then repeat the symbolic links or copy steps from the Manual Installation section
```

## Uninstallation

### Using Fisher

```fish
fisher remove username/fish_variables
```

### Manual Uninstallation

Remove the symlinks or files:

```fish
# Remove symlinks or files
rm ~/.config/fish/functions/fish_vars*.fish
rm ~/.config/fish/completions/fish_vars*.fish
rm ~/.config/fish/conf.d/fish_vars*.fish

# Optionally remove the cloned repository
rm -rf ~/.config/fish/fish_variables
```

## Troubleshooting

### Common Installation Issues

1. **Function not found**: Ensure the functions are properly installed in your Fish functions directory.

   ```fish
   ls -la ~/.config/fish/functions/fish_vars*.fish
   ```

2. **Permission issues**: Check file permissions.

   ```fish
   chmod +x ~/.config/fish/functions/fish_vars*.fish
   ```

3. **Path issues**: Make sure your Fish configuration paths are correct.

   ```fish
   echo $fish_function_path
   ```

If you encounter any other issues, please open an issue on the GitHub repository.
