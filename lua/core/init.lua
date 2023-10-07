local opt = vim.opt
local g = vim.g

-- local config = require("core.utils").load_config()

-------------------------------------- globals -----------------------------------------

-- g.nvchad_theme = config.ui.theme
-- g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
-- g.toggle_theme_icon = "   "
-- g.transparency = config.ui.transparency

-------------------------------------- options ------------------------------------------

-- Global statusline
opt.laststatus = 3 
opt.showmode = false

opt.clipboard = "unnamedplus"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Search
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

-- Mouse behaviour
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- Disable nvim intro
opt.shortmess:append "sI"

-- Additional info column for plugins
opt.signcolumn = "yes"

-- Window split behaviour
opt.splitbelow = true
opt.splitright = true

-- UI options
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = "80"

-- Timeout for a mapping execution
opt.timeoutlen = 400

-- Save undo history to a file
opt.undofile = true

-- Interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
-- local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
-- vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
