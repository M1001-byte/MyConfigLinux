-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}},
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

require('tokyonight').setup {
    theme='tokyonight-night',
    transparent=true
  }

vim.opt.number = true
vim.cmd("colorscheme tokyonight-night")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
