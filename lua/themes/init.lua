-- require("themes.onenord")
-- require("themes.nord")
require("themes.onedark")
-- require("themes.oxocarbon")
-- require("themes.aylin")
-- require("themes.poimandres")
-- require("themes.doomone")
-- require("themes.noctis")

-- Color correction
vim.cmd([[
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif
set background=dark
"hi Normal guibg=none
]])
