# nvim
This is my Neovim configuration.

I use this configuration on a laptop and a pc and the reason for making this repository is so that I can more easily update the configuration on either one.

NOTE: This configuration will change over time as I establish my preferences and add all the features I need.

# Features
* Package manager (lazy)
* Lazy plugin loading for fast startup time
* File manager[^1] (nvim-tree)
* Session tracking[^2] (Obsession)
* Compile/run[^3]
* Syntax Highlighting (Treesitter)
* Code folding (Treesitter)
* Real-time error-checking for C&C++ (clangd)
* Transparency
* Vimwiki

[^1]: `F1` can be used to toggle the file tree on and off.
[^2]: Can be toggled on and off with `F2`. It is off by default. To return to a session use `nvim -S Session.vim` in the folder where the session tracking was done.
[^3]: Compile and run with `F5`, compile with `<Space> + F5` run with `F6`, run current file with `<Space> + F5` provided by a `build.sh` (or `build.bat` on Windows) and a `run.sh` (`run.bat`) script files in the current working directory.

# Dependencies
* clangd (for C&C++ error checking and possibly autocomplete) - optional
* rust_analyzer (for rust error checking and autocomplete) - optional
* ripgrep (for quick search aka telescope live_grep) - optional

# Installation
The repository has `nvim` as the name so that it can be directly cloned into `.config` on linux or `AppData\Local` on Windows and it will automatically have the correct name to be recognized by neovim.

If you want to make neovim transparent run `:TransparentEnable` and then it will retain that transparency has been turned on.

# Branches

This repository has multiple branches. The `base` branch is a minimalist version of my configuration, whereas the `ide` is a more feature-rich version. The `ide-job` version is a version that has some job-specific stuff added to `ide`. The default branch is `ide`. If you wish to use the minimal version clone with the `-b base` flag.
