vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.background = "dark"

vim.opt.swapfile = false

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- clipboard
vim.opt.clipboard = "unnamedplus" -- use system clipboard

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd("let g:netrw_liststyle = 3")
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
