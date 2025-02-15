return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope_builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", telescope_builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					opener = {
						hidden = false, -- do not show hidden directories
						root_dir = "~", -- search from home directory by default
						respect_gitignore = true, -- respect .gitignore files
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"willthbill/opener.nvim",
		config = function()
			-- 		require("telescope").extensions.opener.opener({
			-- 			hidden = false,
			-- 			respect_gitignore = true,
			-- 			root_dir = "~",
			-- 		})
			vim.api.nvim_set_keymap("n", "<C-k><C-o>", ":Telescope opener<cr>", { noremap = true, silent = true })
		end,
	},
}
