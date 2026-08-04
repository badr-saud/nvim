-- Terminal configuration
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<space>tt", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)

-- Restore cursor shape on exit (terminals can leave it changed)
vim.api.nvim_create_autocmd("VimLeave", {
  group = vim.api.nvim_create_augroup("restore-cursor-shape-on-exit", { clear = true }),
  command = "set guicursor=a:ver1",
})
