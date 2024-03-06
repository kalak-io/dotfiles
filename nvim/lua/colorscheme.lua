--****************************************************************************** 
-- COLORSCHEME.LUA
-- Setup window interface
--****************************************************************************** 

local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.syntax = 'on'
o.ruler = true
o.showcmd = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = false
o.linebreak = true
o.tw = 500
o.virtualedit = 'onemore' -- Allow the cursor to move just past the end of the line
o.showmode = false -- Don't display the current mode

o.completeopt = "menuone,noselect"
o.scrolloff = 10
o.sidescrolloff = 5

o.termguicolors = true
o.t_Co = 256
