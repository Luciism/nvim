return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
            window = {
                mappings = {
                    ["<C-n>"] = "close_window", -- This will close Neotree when you're in its buffer
                }
            },
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					visible = true,
					-- hide_gitignored = false,
				},
			},
		})

		vim.keymap.set("n", "<C-n>", ":Neotree focus left<CR>", {silent = true})
	end,
}
