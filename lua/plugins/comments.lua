return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                toggler = {
                    line = "<C-_>",
                    block = "<C-M-_>",
                },
                opleader = {
                    line = "<C-_>",
                    block = "<C-M-_>",
                },
            })
        end,
    },
}
