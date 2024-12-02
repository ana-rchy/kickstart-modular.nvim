-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et

-- user stuff
local opts = {
  noremap = true, -- non-recursive
  silent = true, -- do not show message
}

-- window navigation
vim.keymap.set('n', '<A-Left>', '<C-w>h', opts)
vim.keymap.set('n', '<A-Down>', '<C-w>j', opts)
vim.keymap.set('n', '<A-Up>', '<C-w>k', opts)
vim.keymap.set('n', '<A-Right>', '<C-w>l', opts)

-- resize with arrows
vim.keymap.set('n', '<A-S-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<A-S-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<A-S-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<A-S-Right>', ':vertical resize +2<CR>', opts)

-- indents when in visual mode
vim.keymap.set('v', '<S-Tab>', '<gv', opts)
vim.keymap.set('v', '<Tab>', '>gv', opts)

-- save
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true })
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>v', { noremap = true })

-- term
vim.keymap.set('n', '<A-CR>', ':sp | term<CR>', opts)
vim.keymap.set('n', '<A-S-CR>', ':vs | term<CR>', opts)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)

-- neotree
vim.keymap.set({ 'v', 'i', 'n' }, '<A-`>', '<Esc>:Neotree toggle<CR>', opts)

-- delete not cut
vim.keymap.set({ 'v', 'n' }, 'd', '"_d', opts)
vim.keymap.set({ 'v', 'n' }, 'x', '"_x', opts)
vim.keymap.set({ 'v', 'n' }, '<C-d>', 'd', opts)
