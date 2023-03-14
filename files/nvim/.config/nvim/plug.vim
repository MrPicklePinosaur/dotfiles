
call plug#begin()

Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'ron-rs/ron.vim'
Plug 'DingDean/wgsl.vim'
Plug 'ziglang/zig.vim'
Plug 'NoahTheDuke/vim-just'

" Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jupyter-vim/jupyter-vim'

call plug#end()

" fzf
map <leader>F :GFiles<cr>
map <leader>b :Buffers<cr>
map <leader>t :Tags<cr>

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

