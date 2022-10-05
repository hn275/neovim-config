-- Color correction
vim.cmd([[
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif
set background=dark
]])

-- require("themes.catppuccin")
-- require("themes.myspace")
-- require("themes.dracula")
-- require("themes.gruvbox")
-- require("themes.nightfly")
-- require("themes.nightfox")
-- require("themes.nord")
-- require("themes.onenord")
-- require("themes.onedark")
-- require("themes.tokyonight")
require("themes.oxocarbon")
