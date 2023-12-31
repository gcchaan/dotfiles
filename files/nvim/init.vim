" タブ補完
set ignorecase
set smartcase

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'chrisbra/matchit'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }

" TODO:
" Plug 'williamboman/mason.nvim'
call plug#end()
nnoremap <C-1> :NERDTreeToggle<CR>
nnoremap <C-p> <cmd>Telescope find_files<cr>

noremap j gj
noremap k gk
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

nnoremap x "_x
nnoremap s "_s

imap {} {}<Left>
imap [] []<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

nnoremap <leader><leader> :source ~/.config/nvim/init.vim<cr>
