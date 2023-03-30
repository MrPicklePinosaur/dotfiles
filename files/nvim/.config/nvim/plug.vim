
call plug#begin()

" general purpose
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" lsp servers
Plug 'ron-rs/ron.vim'
Plug 'DingDean/wgsl.vim'
Plug 'ziglang/zig.vim'
Plug 'NoahTheDuke/vim-just'

" Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jupyter-vim/jupyter-vim'

" neotree (maybe too heavy)
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" fzf
map <leader>F :GFiles<cr>
map <leader>b :Buffers<cr>
map <leader>t :Tags<cr>

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" neotree
" override netrw
map <leader>f :Neotree source=filesystem reveal=true position=right<cr>

