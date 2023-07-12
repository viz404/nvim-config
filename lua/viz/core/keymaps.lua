
vim.g.mapleader = " "

-- Move current line up
vim.api.nvim_set_keymap('n', '<M-k>', ':move -2<CR>', { silent = true })

-- Move current line down
vim.api.nvim_set_keymap('n', '<M-j>', ':move +1<CR>', { silent = true })

-- Clear search
-- 
