return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter_config = require("nvim-treesitter.configs")
        treesitter_config.setup({
            ensure_installed = { "rust", "python", "lua", "toml" },
            -- ensure_installed = { "lua", "python", "javascript", "typescript", "json", "json5", "css", "html", "rust", "markdown", "dockerfile", "sql" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
