# nvim
This is my Neovim configuration.

I use this configuration on a laptop and a pc and the reason for making this repository is so that I can more easily update the configuration on either one.

NOTE: This configuration will change over time as I establish my preferences and add all the features I need.

# Features
* Package manager[^1] (packer)
* File manager (nvim-tree)
* Session tracking[^2] (Obsession)
* Compile/run[^3]
* Syntax Highlighting (Treesitter)
* Code folding based (Treesitter)
* Real-time error-checking for C/C++ (clangd)

[^1]: `F1` can be used to toggle the file tree on and off.
[^2]: Can be toggled on and off with `F2`. It is off by default. To return to a session use `nvim -S Session.vim` in the folder where the session tracking was done.
[^3]: Compilation with `F5`, run with `F6` provided by a `compile.sh` (or `compile.bat` on Windows) and a `run.sh` (`run.bat`) script files in the parent directory of the project.

# Prerequisites
* clangd (for error checking and possibly autocomplete)

# Installation
The repository has `nvim` as the name so that it can be directly cloned into `.config` on linux or `AppData\Local` on Windows and it will automatically have the correct name to be recognized by neovim.
