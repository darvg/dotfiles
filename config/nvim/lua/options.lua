local cmd = vim.cmd
local indent = 2

local opt = vim.opt
local g = vim.g

-- global settings
g.mapleader = " "


-- local settings
opt.guifont = "Iosevka Custom:h12"
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
opt.hidden = true
opt.confirm = true
opt.cursorline = true
opt.mouse = "a"
opt.number = true
opt.foldmethod = "manual"
opt.ruler = false
opt.ignorecase = true
opt.pumblend = 10
opt.pumheight = 8
-- opt.signcolumn = "yes"
opt.showmode = false
opt.cmdheight = 1

opt.smartcase = true
opt.shiftround = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartindent = true


-- colors
opt.termguicolors = true

cmd("au BufWinEnter * normal zR")
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"


-- commands --
-- reload file on change
cmd("au FocusGained * :checktime")

-- show cursor line in active window
cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])

-- highlight yank
cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

cmd("au TextYankPost * lua vim.highlight.on_yank {}")
