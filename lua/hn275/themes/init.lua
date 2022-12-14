local get_color = require("hn275.util.get_color")

require("hn275.themes.onenord")
-- require("hn275.themes.onedark")
-- require("hn275.themes.noctis")

-- Color correction
vim.cmd([[
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif
set background=dark
]])

local hl_color = get_color("Keyword").fg
vim.api.nvim_set_hl(0, "MatchParen", { bold = true, bg = "none", fg = hl_color })
