vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number relativenumber")

vim.diagnostic.config({ virtual_text = false })

-- vim.cmd("Neotree toggle left")
vim.g.mapleader = " "

vim.cmd("highlight EndOfBuffer guifg=#45475A")
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)


-- Treat *.tmux and *.tmux.conf as tmux filetype
vim.api.nvim_create_augroup("ftdetect_tmux", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "ftdetect_tmux",
  pattern = { "*.tmux", "*.tmux.conf" },
  callback = function() vim.cmd("setfiletype tmux") end,
})

