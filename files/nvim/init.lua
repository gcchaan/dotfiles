vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { 'williamboman/mason.nvim', build = ':MasonUpdate', opts = {}, },

  { 'preservim/nerdtree', cmd = 'NERDTreeToggle' },

  { 'tpope/vim-surround', event = 'VeryLazy' },
  { 'machakann/vim-highlightedyank', event = 'VeryLazy' },
  { 'chrisbra/matchit', event = 'VeryLazy' },

})


local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<C-1>', ':NERDTreeToggle<CR>', opts)
keymap('n', '<Leader>e', ':NERDTreeToggle<CR>', opts)

keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<Leader>gg', '<cmd>Telescope buffers<cr>', opts)

keymap({'n', 'v'}, 'j', 'gj', { noremap = true })
keymap({'n', 'v'}, 'k', 'gk', { noremap = true })
keymap('n', '<S-h>', '^', opts)
keymap('n', '<S-l>', '$', opts)
keymap('n', '<S-j>', '}', opts)
keymap('n', '<S-k>', '{', opts)

keymap('n', 'x', '"_x', opts)
keymap('n', 's', '"_s', { noremap = true })

keymap('i', '{}', '{}<Left>', opts)
keymap('i', '[]', '[]<Left>', opts)
keymap('i', '""', '""<Left>', opts)
keymap('i', "''", "''<Left>", opts)
keymap('i', '<>', '<><Left>', opts)

keymap('n', '<leader><leader>', '<cmd>source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = false })
