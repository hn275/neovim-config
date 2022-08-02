local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- nerd font icon: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  enabled = function(fallback) -- disable cmp in when commenting
    local context = require("cmp.config.context")
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture( "comment" )
        and not context.in_syntax_group("Comment")
    end
  end,
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(), -- completion border
    documentation = cmp.config.window.bordered(), -- documentation border
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- next item
    ["<C-j>"] = cmp.mapping.select_next_item(), -- previous item
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` to remove the default `<C-y>` mapping.
    ["<C-z>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- only select the hovering autocomplete
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then -- expand snippets if matched
        vim.fn["UltiSnips#ExpandSnippet"]()
      elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then -- jump forward if possible
        vim.fn["UltiSnips#JumpForwards"]()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  matching = {
    disallow_fuzzy_matching = false, -- allow fuzzy matching 
    disallow_partial_matching = false,-- allow partial matching

  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- autocompletion source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[BUF]",
        path = "[PATH]",
        ultisnips = "[SNIPS]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "npm" }, -- maybe one day i'll start using this
    { name = "ultisnips" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  experimental = {
    ghost_text = true,
  },
}
