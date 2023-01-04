require("sessions").setup()
vim.api.nvim_set_keymap("n", "<leader>sf", "<CMD>Session list<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sn", "<CMD>Session new<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sd", "<CMD>Session delete<CR>", { silent = true, noremap = true })
