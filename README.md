# NeoVim configuration

Written in lua.

This NeoVim environment is configured in an Arch Linux machine.

## Features and plugins

- NvimTree file explorer
- Builtin toggle terminals
- Git signs support
- TodoComment
- Telecope fuzzy finder
- Custom comment string for react jsx tags
- Bufwrite autocmd, current `null-ls` is receiving support for:
  - CSS/SCSS, JavaScript,
    JavaScript React,
    TypeScript,
    TypeScript React,
    HTML,
    JSON: `prettierd`
  - Lua: `stylua`
  - Markdown: `markdownlint`
  - Python: `black`
- Super Tab behavior for `cmp`
- LSP server:
  - CSS/SCSS (cssls)
  - Cpp (cppls)
  - JSON (jsonls)
  - Lua (sumneko_lua)
  - Markdown (marksman)
  - Python (pyright)
  - TS/JS (tsserver)

## Themes

To change themes, comment/uncomment file `./lua/themes/init.lua`

Available Themes:

- Catppuccin
- Deepspace
- Dracula
- Everforest
- Gruvbox
- Nightfly
- Nightfox
- Nord
- OceanicNext
- OneDark
- Tokyonight

### TODO

- [x] Clean up cmp
- [x] Ghost text for autocompletion
- [x] Migrate to lua
- ~~[x] Super tab function for UltiSnip~~
- [ ] cheatsheet for keybindings.
- Snippets
  - [ ] Make a cheatsheet
  - [x] Custom snippets for React
  - Boilerplate:
    - [x] html5
    - [x] reset.css

### Reminder for new set up

Open up `./lua/plugins/plugins.lua` and write the file. `Packer` is
bootstrapped to install all required dependencies and plugins

Or run this code (in bash shell)

```Shell
cd $HOME/.config
git clone https://github.com/hn275/neovim-config.git
nvim +PackerSync
```
