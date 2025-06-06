return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "eslint_d"
            },
        },
        config = function()
            -- require("mason").setup()
            require("mason").setup({
                PATH = "prepend", -- "skip" seems to cause the spawning error
            })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "basedpyright", "html", "cssls", "eslint", "dockerls", "docker_compose_language_service", "nil_ls", "graphql" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/nvim-lsp-installer",
		},
		opts = {
			servers = {
				cssls = {},
				html = {},
				basedpyright = {
					settings = {
						basedpyright = {
							typeCheckingMode = "standard",
						},
					},
				},
				javascript = {},
				eslint = {},
				ts_ls = {},
				nil_ls = {},
                graphql = {
                    command = "graphql-lsp",
                    args = { "server", "-m", "stream" },
                    -- customize filetypes to your needs
                    filetypes = { "typescript", "typescriptreact", "graphql" },
                    -- settings = {
                    -- "graphql-config.load.legacy" = true
                    -- }
                }
			},
		},
		config = function()
			require("nvim-lsp-installer").setup({})

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local on_attach = require("cmp_nvim_lsp").on_attach

            local lspconfig = require("lspconfig")
            local util = require("lspconfig/util")

            -- lspconfig.dockerls.setup({capabilities = capabilities})
            -- lspconfig.docker_compose_language_service.setup({capabilities = capabilities})
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.basedpyright.setup({ capabilities = capabilities })
			lspconfig.css_variables.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.nil_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "rust" },
				root_dir = util.root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
