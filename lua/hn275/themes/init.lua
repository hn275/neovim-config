-- require("hn275.themes.onenord")
-- require("hn275.themes.nord")
require("hn275.themes.onedark")
-- require("hn275.themes.oxocarbon")
-- require("hn275,themes.aylin")
-- require("hn275.themes.poimandres")
-- require("hn275.themes.doomone")
-- require("hn275.themes.noctis")

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
