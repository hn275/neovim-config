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
	use("akinsho/toggleterm.nvim") -- toggle term
	use("folke/todo-comments.nvim") -- todo-comments
	use("jiangmiao/auto-pairs") -- auto pairs
	use("mattn/emmet-vim") -- emmet-vim for html tags
	use("tpope/vim-commentary") -- comment toggler
	use("wbthomason/packer.nvim") -- have packer manages itself
	use({ "nvim-lualine/lualine.nvim", requires = { opt = true } }) -- lua line
	use("ThePrimeagen/harpoon") -- harpoon
	use("nvim-telescope/telescope.nvim")
	use("lewis6991/impatient.nvim") -- faster boot up time
	use("kyazdani42/nvim-tree.lua") -- file explorer
	use("lervag/vimtex") -- latex plugin
	use("nvim-neorg/neorg") -- neorg
	use("toppair/reach.nvim") -- mark ui
	use("jalvesaq/nvim-r") -- R extensions for neovim
	use("MunifTanjim/nui.nvim") -- ui plugin
	use("williamboman/mason.nvim") -- lsp server installer
	-- LSP --
	use("jose-elias-alvarez/null-ls.nvim") -- null ls
	use("neovim/nvim-lspconfig") -- LSP server
	-- CMP COMPLETION --
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	-- MARKDOWN PREVIEW --
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	-- NVIM TREE SITTER --
	use("itchyny/vim-gitbranch")
	use("ryanoasis/vim-devicons")
	use("sheerun/vim-polyglot")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- nvim treesitter
	-- LANGUAGE SYNTAX --
	use("JoosepAlviste/nvim-ts-context-commentstring") -- comment string for react
	use("windwp/nvim-ts-autotag") -- auto close tsx and jsx tags
	-- SNIPPETS --
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip")
	-- THEME PLUGINS --
	use("EdenEast/nightfox.nvim")
	use("Mofiqul/dracula.nvim")
	use("bluz71/vim-nightfly-guicolors")
	use("folke/tokyonight.nvim")
	use("liuchengxu/space-vim-dark")
	use("mhartington/oceanic-next")
	use("joshdick/onedark.vim")
	use("sainnhe/everforest")
	use("sainnhe/gruvbox-material")
	use("shaunsingh/nord.nvim")
	use("tyrannicaltoucan/vim-deep-space")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "rmehri01/onenord.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
