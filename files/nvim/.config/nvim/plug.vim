
call plug#begin()

Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'ron-rs/ron.vim'
Plug 'DingDean/wgsl.vim'
Plug 'ziglang/zig.vim'

call plug#end()

" fzf
map <leader>F :FZF<cr>

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

