require("sessions").setup()

vim.api.nvim_set_keymap("n", "<leader>sf", "<CMD>SessionFind<CR>", { silent = false, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sn", ":SessionNew ", { silent = false, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sd", ":SessionDel ", { silent = false, noremap = true })
