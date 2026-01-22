-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_set_option("clipboard", "unnamed")

require("lazy").setup("plugins")
require("vim-options")

-- for random colorscheme selection
--math.randomseed(os.time())
--local colorschemes = { "rose-pine", "onenord",  "catppuccin", "everforest", "tokyonight", "nightfox", "monokai-pro" ,"github_dark_default" }
--local cs = colorschemes[math.random(1, #colorschemes)]
--vim.cmd.colorscheme(cs)
vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("everforest")
-- vim.cmd.colorscheme("github_dark_default")
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("github_light_default")
-- vim.cmd.colorscheme("github_light_tritanopia")
-- vim.cmd.colorscheme("tokyonight-day")
--print(cs)

--Terminal configuration
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

vim.keymap.set("n", "<space>tt", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)

-- reserving cursor shape in terminal
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver1
    augroup END
]])
