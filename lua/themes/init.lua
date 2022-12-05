-- Color correction
vim.cmd([[
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif
set background=dark
]])

-- require("themes.onenord")
-- require("themes.nord")
-- require("themes.onedark")
require("themes.aylin")

-- vim.cmd("hi Normal guibg=none")
