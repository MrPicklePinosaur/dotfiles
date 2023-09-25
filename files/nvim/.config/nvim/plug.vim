
call plug#begin()

" general purpose
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'windwp/nvim-autopairs'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'uga-rosa/cmp-dictionary'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" lsp servers / languages
Plug 'ron-rs/ron.vim'
Plug 'DingDean/wgsl.vim'
Plug 'ziglang/zig.vim'
Plug 'NoahTheDuke/vim-just'
Plug 'neovimhaskell/haskell-vim'
Plug 'jupyter-vim/jupyter-vim'
Plug 'kaarmu/typst.vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'PietroPate/vim-tex-conceal', { 'for': 'tex' }

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

" utilities
Plug 'nvim-telescope/telescope.nvim'
Plug 'startup-nvim/startup.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'rlue/vim-barbaric'

" tool integrations
Plug 'puremourning/vimspector'
Plug 'kdheepak/lazygit.nvim'
Plug 'lambdalisue/suda.vim'
Plug 'akinsho/toggleterm.nvim'

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

" vimtex
let g:vimtex_compiler_latexmk = {
 \'out_dir': '/home/pinosaur/.cache/latexaux/',
\}


" vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
lua << EOF
local statusline = require('statusline')
statusline.tabline = false

require("nvim-autopairs").setup {}
EOF

" suda vim
cmap w!! SudaWrite


set showtabline=2
" colorscheme catppuccin-latte
colorscheme catppuccin-macchiato

