local rename = require("lsp-config.utils.rename")

local M = {}

local ignored_format_servers = {
	"clangd",
	"tsserver",
}

M.on_attach = function(client, bufnr)
	-- Init
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Set key map
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", bufopts)
	-- vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "gs", "<CMD>Lspsaga signature_help<CR>", bufopts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gd", "<CMD>Lspsaga preview_definition<CR>", bufopts)
	-- vim.keymap.set("n", "ge", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "ge", "<CMD>Lspsaga show_line_diagnostics<CR>", bufopts)
	vim.keymap.set("n", "gn", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "<leader>rn", rename, bufopts)
	-- Ignore autoformat on certain servers
	client.server_capabilities.documentFormattingProvider = (function()
		for _, v in pairs(ignored_format_servers) do
			if v == client.name then
				return false
			end
		end
		return true
	end)()
end

-- Flags
M.lsp_flags = {
	debounce_text_changes = 100,
}

-- setup
M.default_settings = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- virtual text on diagnostic
		signs = { active = signs }, -- show signs/icons
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "single",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "single",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "single",
	})
end

-- enable builtin snippet support
M.capabilities = function()
	return vim.lsp.protocol.make_client_capabilities()
end

return M
