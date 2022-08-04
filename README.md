# NeoVim configuration

All configuration is (finally) written in lua.

This NeoVim environment is configured in an Arch Linux machine.

## Features and plugins

- NvimTree file explorer
- Builtin toggle terminals
- Git signs support
- Blank line indentation indicator
- `TODO:` comment
- Telecope fuzzy finder
- Custom comment string for `JSX` tags
- Autoformat on BufWrite, current `null-ls` is receiving support for:
  - CSS/SCSS, JavaScript,
    JavaScript React,
    TypeScript,
    TypeScript React,
    HTML,
    JSON: `prettierd`
  - Lua: `stylua`
  - Markdown: `markdownlint`
  - Python: `black`
- Super Tab behavior for `cmp` and `UltiSnip`
- LSP server:
  - CSS/SCSS (cssls)
  - Cpp (cppls)
  - JSON (jsonls)
  - Lua (sumneko_lua)
  - Markdown (marksman)
  - Python (pyright)
  - TS/JS (tsserver)

## Themes

To change themes, simply comment/uncomment file `./lua/themes/init.lua`

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

- [x] Clean up cmp, it is a hot mess
- [x] Ghost text for autocompletion
- [x] Migrate to lua, VimScript sucks :/
- [x] Super tab function for UltiSnip
- [ ] cheatsheet for keybindings.
- Snippets
  - [ ] Make a cheatsheet
  - [ ] Custom snippets for React | in progress
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

Happy hacking.
