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

-- Leader must be set before lazy.setup so plugin `keys` specs referencing
-- <leader> resolve correctly
vim.g.mapleader = " "

require("lazy").setup("plugins")
require("vim-options")
require("terminal")

-- Active colorscheme (see lua/plugins/themes.lua, lua/plugins/onenord.lua and
-- lua/plugins/night-owl.lua for the other themes configured and ready to use)
vim.cmd.colorscheme("rose-pine")
