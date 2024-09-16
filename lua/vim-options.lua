vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.cursorline = true

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd("let g:netrw_liststyle = 3")
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
