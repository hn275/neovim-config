local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})
-- Install your plugins here
return packer.startup(function(use)
	-- SO MANY PLUGINS REQUIRE THESE, JUST HAVE THEM UP HERE --
	use("kyazdani42/nvim-web-devicons") -- So many plugins require this
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	-- PLUGINS --
	use("folke/todo-comments.nvim") -- todo-comments
	use("windwp/nvim-autopairs")
	use("tpope/vim-commentary") -- comment toggler
	use("wbthomason/packer.nvim") -- have packer manages itself
	use("nvim-telescope/telescope.nvim")
	use("lewis6991/impatient.nvim") -- faster boot up time
	use("kyazdani42/nvim-tree.lua") -- file explorer
	use("lervag/vimtex") -- latex plugin
	use({ "nvim-neorg/neorg", run = ":Neorg sync-parsers" }) -- neorg
	use("jalvesaq/nvim-r") -- R extensions for neovim
	use("MunifTanjim/nui.nvim") -- ui plugin
	use("williamboman/mason.nvim") -- lsp server installer
	use("itchyny/vim-gitbranch")
	use("akinsho/toggleterm.nvim") -- toggle terminal
	-- LSP --
	use("jose-elias-alvarez/null-ls.nvim") -- null ls
	use("neovim/nvim-lspconfig") -- LSP server
	-- CMP COMPLETION --
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip") -- for luasnip
	use("davidgranstrom/nvim-markdown-preview") -- markdown preview
	-- NVIM TREE SITTER --
	use("ryanoasis/vim-devicons")
	-- use("sheerun/vim-polyglot")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- nvim treesitter
	-- LANGUAGE SYNTAX --
	use("windwp/nvim-ts-autotag") -- auto close tsx and jsx tags
	use("sheerun/vim-polyglot") -- syntax highlighting
	-- SNIPPETS --
	use("L3MON4D3/LuaSnip") -- snippet engine
	-- THEME PLUGINS --
	use("Mofiqul/dracula.nvim")
	use("joshdick/onedark.vim")
	use("shaunsingh/nord.nvim")
	use("EdenEast/nightfox.nvim")
	use("Shatur/neovim-ayu")

	-- My plugin
	use("~/plugins/git.nvim")
	-- use("~/plugins/chtsh.nvim")
	-- use("~/plugins/simpleline.nvim")
	use("hn275/simpleline.nvim")
	use("~/plugins/icee.nvim")
	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
