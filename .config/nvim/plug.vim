
call plug#begin()

Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'junegunn/fzf'

call plug#end()

" fzf
map <leader>F :FZF<cr>

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
