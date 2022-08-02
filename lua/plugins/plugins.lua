local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}
-- Install your plugins here
return packer.startup(function(use)

    -- SO MANY PLUGINS REQUIRE THESE, JUST HAVE THEM UP HERE --
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "kyazdani42/nvim-web-devicons" -- So many plugins require this

    -- PLUGINS --
    use "wbthomason/packer.nvim" -- have packer manages itself
    use "Chiel92/vim-autoformat" -- Autoformat
    use "mattn/emmet-vim" -- emmet-vim for html tags
    use "jiangmiao/auto-pairs" -- auto pairs
    use "RRethy/vim-illuminate" -- variables highlighting
    use "akinsho/toggleterm.nvim" -- toggle term
    use "tpope/vim-commentary" -- comment toggler
    use "nvim-telescope/telescope.nvim" -- telescope
    use "folke/todo-comments.nvim" -- todo-comments
    use "folke/trouble.nvim" -- trouble
    use "folke/lsp-colors.nvim" -- lsp color correction
    use "lukas-reineke/indent-blankline.nvim" -- blank indentation
    use { "akinsho/bufferline.nvim", tag = "v2.*" } -- bufferline
    use { "nvim-lualine/lualine.nvim", requires = { opt = true } } -- lua line
    use "neovim/nvim-lspconfig" -- LSP server
    use { 'goolord/alpha-nvim' } -- dash board greeter 
    use { 'jose-elias-alvarez/null-ls.nvim' } -- null ls
    use { 'seblj/nvim-tabline' } -- tab line 
    use { 'lewis6991/gitsigns.nvim' } -- git signs

    -- CMP COMPLETION --
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use 'hrsh7th/cmp-nvim-lsp'
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "quangnguyen30192/cmp-nvim-ultisnips"
    -- use 'David-Kunz/cmp-npm' -- maybe one day ill start configuring my own package.json

    -- MARKDOWN PREVIEW --
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- NVIM TREE SITTER --
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- nvim treesitter
    use "sheerun/vim-polyglot"
    use "itchyny/vim-gitbranch"
    use "kyazdani42/nvim-tree.lua"
    use "ryanoasis/vim-devicons"

    -- LANGUAGE SYNTAX SPECIFIC --
    -- javacsriptreact and typescriptreact
    use "yuezk/vim-js" -- syntax for JavaScript
    use "maxmellon/vim-jsx-pretty" -- syntax for JavaScript React
    use "JoosepAlviste/nvim-ts-context-commentstring" -- comment string for react
    use "windwp/nvim-ts-autotag" -- auto close tsx and jsx tags

    -- css
    use "ap/vim-css-color" -- color highlighting for css

    -- SNIPPETS --
    use "SirVer/UltiSnips"
    use "honza/vim-snippets"

    -- THEME PLUGINS --
    use "sainnhe/gruvbox-material"
    use "joshdick/onedark.vim"
    use "edkolev/tmuxline.vim"
    use "rakr/vim-one"
    use "liuchengxu/space-vim-dark"
    use "tyrannicaltoucan/vim-deep-space"
    use "folke/tokyonight.nvim"
    use "mhartington/oceanic-next"
    use "EdenEast/nightfox.nvim"
    use "shaunsingh/nord.nvim"
    use "bluz71/vim-nightfly-guicolors"
    use "sainnhe/everforest"
    use 'Mofiqul/dracula.nvim'
    use { 'catppuccin/nvim', as = "catppuccin" }

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
