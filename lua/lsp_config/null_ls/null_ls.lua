local null_ls_status, null_ls = pcall(require, "null0ls")

if not null_ls_status then return end
null_ls.setup({
    sources = {
        -- Code actions
        null_ls.builtins.code_actions.eslint_d, -- js, jsx, ts, tsx
        -- Diagnostics
        null_ls.builtins.diagnostics.eslint_d, -- js, jsx, ts, tsx
        null_ls.builtins.diagnostics.stylint, -- css, scss, sass, less
        null_ls.builtins.diagnostics.tsc, -- tsc compiler linter
    }
})
