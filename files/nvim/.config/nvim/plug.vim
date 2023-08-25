
call plug#begin()

" general purpose
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
" Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
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

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'windwp/nvim-ts-autotag'

" theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" statusline (temp)
Plug 'beauwilliams/statusline.lua'

" Plug 'VonHeikemen/fine-cmdline.nvim'

" debugger
Plug 'puremourning/vimspector'

" terminal

Plug 'akinsho/toggleterm.nvim'

" other stuff
Plug 'nvim-telescope/telescope.nvim'
Plug 'startup-nvim/startup.nvim'
" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'yamatsum/nvim-nonicons'
" Plug 'MrPicklePinosaur/status.vim'

" Plug 'pwntester/octo.nvim'

Plug 'famiu/bufdelete.nvim'

Plug 'rlue/vim-barbaric'

Plug 'kdheepak/lazygit.nvim'

" copilot
" Plug 'zbirenbaum/copilot.lua'
" Plug 'zbirenbaum/copilot-cmp'

call plug#end()

" bdelete
nnoremap <leader>d <cmd>lua require('bufdelete').bufdelete(0, true)<CR>

" neotree
" override netrw
map <leader>f :Neotree source=filesystem reveal=true position=right<cr>

" vimspector
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]

" barbaric

" lazygit

nnoremap <leader>g :LazyGit<cr>

" vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
lua << EOF
local statusline = require('statusline')
statusline.tabline = false

require("nvim-autopairs").setup {}
EOF

set showtabline=2
" colorscheme catppuccin-latte
colorscheme catppuccin-macchiato
