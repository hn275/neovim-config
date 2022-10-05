-- Color correction
vim.cmd([[
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif
set background=dark
]])

-- require("themes.myspace")
-- require("themes.dracula")
-- require("themes.nord")
-- require("themes.onedark")
require("themes.material.material")
