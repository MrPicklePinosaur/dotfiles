
call plug#begin()

" general purpose
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" lsp servers / languages
Plug 'ron-rs/ron.vim'
Plug 'DingDean/wgsl.vim'
Plug 'ziglang/zig.vim'
Plug 'NoahTheDuke/vim-just'
Plug 'neovimhaskell/haskell-vim'
Plug 'jupyter-vim/jupyter-vim'

" neotree (maybe too heavy)
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'

" theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" statusline (temp)
Plug 'beauwilliams/statusline.lua'

" other stuff
Plug 'nvim-telescope/telescope.nvim'
Plug 'startup-nvim/startup.nvim'
" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'yamatsum/nvim-nonicons'
" Plug 'MrPicklePinosaur/status.vim'

call plug#end()

" neotree
" override netrw
map <leader>f :Neotree source=filesystem reveal=true position=right<cr>

lua << EOF
local statusline = require('statusline')
statusline.tabline = false
EOF

set showtabline=2
colorscheme catppuccin-macchiato
