# Plugin configurations

Plugin configurations for Neovim, using [Lazy.nvim](https://github.com/folke/lazy.nvim) and [plugin-configuration-loader.nvim](https://github.com/RadicalTeapot/plugin-configuration-loader.nvim).

## How to add a plugin

Create a new directory containing the plugin name (usually under a more general directory, e.g. `ui/colorscheme`) inside the `lua` folder.
`init.lua` file is the configuration that will be loaded when the plugin is loaded.
`default.lua` is the default override for the plugin
Any other lua file might be loaded based on the options passed to the `plugin-configuration-loader`.

## How to add a neovim configuration

Create a new lua file inside `lua/plugin-lists` and return a table containing the names of the plugins to load.

## Mentions and inspiration

- The amazing [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager
