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
			return require("packer.util").float({ border = "rounded" })
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
	-- use("goolord/alpha-nvim") -- dash board greeter
	use("jiangmiao/auto-pairs") -- auto pairs
	use("lewis6991/gitsigns.nvim") -- git signs
	use("lukas-reineke/indent-blankline.nvim") -- blank indentation
	use("mattn/emmet-vim") -- emmet-vim for html tags
	use("nvim-telescope/telescope.nvim") -- telescope
	use("tpope/vim-commentary") -- comment toggler
	use("wbthomason/packer.nvim") -- have packer manages itself
	use({ "nvim-lualine/lualine.nvim", requires = { opt = true } }) -- lua line
	use("ThePrimeagen/harpoon") -- harpoon
	use("MunifTanjim/nui.nvim") -- popup gui
	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	-- LSP --
	-- use("folke/lsp-colors.nvim") -- lsp color correction
	use("jose-elias-alvarez/null-ls.nvim") -- null ls
	use("neovim/nvim-lspconfig") -- LSP server
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- LSP UI

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
	use("SirVer/UltiSnips")

	-- THEME PLUGINS --
	use("EdenEast/nightfox.nvim")
	use("Mofiqul/dracula.nvim")
	use("bluz71/vim-nightfly-guicolors")
	use("edkolev/tmuxline.vim")
	use("folke/tokyonight.nvim")
	use("liuchengxu/space-vim-dark")
	use("mhartington/oceanic-next")
	use("navarasu/onedark.nvim")
	use("rakr/vim-one")
	use("sainnhe/everforest")
	use("sainnhe/gruvbox-material")
	use("shaunsingh/nord.nvim")
	use("tyrannicaltoucan/vim-deep-space")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("elvessousa/sobrio")

	-- NEOORG --
	-- use('nvim-neorg/neorg')

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
