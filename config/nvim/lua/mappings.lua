--****************************************************************************** 
-- MAPPINGS.LUA
--****************************************************************************** 

local map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- Enter
map("", "<CR>", "<Esc>i<CR>")

-- Backspace
map("", "<Backspace>", "<Esc>i<Backspace>")

-- Space
map("", "<Space>", "<Esc>i<Space>")

-- Pageup - Move up Line
map("i", "<A-Up>", "<Esc>:m-2<CR>i")
map("n", "<A-Up>", ":m-2<CR>")
map("v", "<A-Up>", ":m'>-2<CR>")

-- Pagedown - Move down Line
map("i", "<A-Down>", "<Esc>:m+<CR>i")
map("n", "<A-Down>", ":m+<CR>")
map("v", "<A-Down>", ":m'>+<CR>")

-- CONTROLS
-- Ctrl E - Open explorer
map("", "<C-e>", ":NvimTreeToggle<CR>")
map("i", "<C-e>", "<Esc>:NvimTreeToggle<CR>")
-- Ctrl F - Find
map("", "<C-f>", ":Telescope live_grep<CR>")
map("i", "<C-f>", "<Esc>:Telescope live_grep<CR>")

-- Ctrl H - Search and Replace
map("i", "<C-h>", "<Esc>:%s/")

-- Ctrl L - Delete all Linees
map("i", "<C-l>", "ggdG")
map("n", "<C-l>", "ggdG")

-- Ctrl P - Launch Telescope
map('', '<C-p>', ':Telescope find_files<CR>') 
map('i', '<C-p>', '<Esc>:Telescope find_files<CR>') 

-- Ctrl Q - Quit
map('', '<C-q>', ':q!<CR>')

-- Ctrl S - Save
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>")
map("v", "<C-s>", "<Esc>:w<CR>")

-- Ctrl T - New tab
map("", "<C-t>", ":tabnew<CR>i")

-- Ctrl X - Close current tab
map("", "<C-x>", ":tabclose<CR>")

-- Ctrl Z - Undo
map("i", "<C-z>", "<Esc>ui")
map("n", "<C-z>", "u")
