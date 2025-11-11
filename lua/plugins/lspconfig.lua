local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"basedpyright",
					"html",
					"cssls",
					"css_variables",
					"eslint",
					"dockerls",
					"docker_compose_language_service",
					"nil_ls",
					"graphql",
					"tailwindcss",
					"rust_analyzer",
					"gopls",
					"sqlls",
					"tombi",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							on_attach = function(_, bufnr)
								local opts = { buffer = bufnr }
								vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
								vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
								vim.keymap.set("n", "gr", vim.lsp.buf.definition, opts)
								vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
							end,
						})
					end,

					-- Override specific servers with custom configs:
					["rust_analyzer"] = function()
						require("lspconfig").rust_analyzer.setup({
							capabilities = capabilities,
							filetypes = { "rust" },
							root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),
							settings = {
								["rust-analyzer"] = {
									cargo = { allFeatures = true },
								},
							},
						})
					end,

					["basedpyright"] = function()
						require("lspconfig").basedpyright.setup({
							capabilities = capabilities,
							settings = {
								basedpyright = {
									typeCheckingMode = "standard",
								},
							},
						})
					end,

					["graphql"] = function()
						require("lspconfig").graphql.setup({
							capabilities = capabilities,
							cmd = { "graphql-lsp", "server", "-m", "stream" },
							filetypes = { "typescript", "typescriptreact", "graphql" },
						})
					end,
				},
			})
		end,
	},
}
