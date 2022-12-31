local k = require("util.keymap").keymap

k("n", "<C-s>s", ":mksession! ~/.nvim/sessions/", { noremap = true })
k("n", "<C-s>l", ":source ~/.nvim/sessions/", { noremap = true })
k("n", "<C-s>d", ":!rm ~/.nvim/sessions/", { noremap = true })

vim.api.nvim_create_user_command("SessionSave", ":mksession! ~/.nvim/sessions/.prev_session", {})
vim.api.nvim_create_user_command("SessionLoad", ":source ~/.nvim/sessions/.prev_session", {})
