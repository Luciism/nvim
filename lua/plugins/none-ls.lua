return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics

            null_ls.setup({
                sources = {
                    formatting.stylua,
                    formatting.prettierd,
                    formatting.isort,
                    formatting.black,
                    formatting.nixfmt,
                    formatting.gofumpt,
                    formatting.pg_format,
                    formatting.remark,
                    formatting.rustywind,
                    formatting.yamlfmt,
                    diagnostics.sqruff,
                    diagnostics.actionlint,
                    diagnostics.djlint,
                    diagnostics.dotenv_linter,
                    require("none-ls.formatting.eslint_d"),
                },
            })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",
                    "prettierd",
                    "isort",
                    "black",
                    "nixfmt",
                    "gofumpt",
                    "pg_format",
                    "sqruff",
                    "actionlint",
                    "djlint",
                    "dotenv_linter",
                    "remark",
                    "rustywind",
                    "yamlfmt",
                    "eslint_d"
                },
                automatic_installation = true,
            })
        end,
    },
}
