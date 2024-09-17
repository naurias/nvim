-- how to add vim script command
-- vim.cmd("VIMSCRIPT COMMAND GOES HERE")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- Remap Space + w + h to move to the left window
vim.api.nvim_set_keymap('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ws', '<C-w>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wq', '<C-w>q', { noremap = true, silent = true })
