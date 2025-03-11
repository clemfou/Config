-- set leader key
vim.g.mapleader = " "

-- clear highlighted search patterns
vim.keymap.set('n', '<Leader><BS>', ':nohls<CR>')

-- move between splits
vim.keymap.set('', '<C-j>', '<C-W>j')
vim.keymap.set('', '<C-k>', '<C-W>k')
vim.keymap.set('', '<C-h>', '<C-W>h')
vim.keymap.set('', '<C-l>', '<C-W>l')

-- fzf
vim.keymap.set('', '<C-p>', ':Files<CR>')
vim.keymap.set('', '<C-m>', ':Marks<CR>')
vim.keymap.set('', '<C-i>', ':History<CR>')

vim.keymap.set('n', '<Leader>l', ':lua toggle_list()<CR>', { noremap = true, silent = true })

-- remap [c and ]c in vimdiff mode
vim.keymap.set('n', '<Leader>n', ']c', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>p', '[c', { noremap = true, silent = true })
