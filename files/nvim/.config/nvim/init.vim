"   _       _ _         _           
"  (_)_ __ (_) |___   _(_)_ __ ___  
"  | | '_ \| | __\ \ / / | '_ ` _ \ 
"  | | | | | | |_ \ V /| | | | | | |
"  |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"

" import vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" includes
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/plug-config/chatgpt.lua
source $HOME/.config/nvim/plug-config/cmp.vim
source $HOME/.config/nvim/plug-config/copilot.lua
" source $HOME/.config/nvim/plug-config/jupyter.vim
source $HOME/.config/nvim/plug-config/magma.vim
source $HOME/.config/nvim/plug-config/neo-tree.vim
source $HOME/.config/nvim/plug-config/startup.lua
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/octo.lua
" source $HOME/.config/nvim/plug-config/treesitter.lua

" since zellij doesn't support undercurl at the moment, change spell hl effect
hi SpellBad       ctermfg=white ctermbg=red cterm=standout
hi SpellRare      ctermfg=white ctermbg=blue cterm=standout
hi SpellLocal     ctermfg=white ctermbg=green cterm=standout

if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

set notimeout
lua << EOF

-- basic configs
vim.opt.number            = true
vim.opt.incsearch         = true
vim.opt.encoding          = 'utf-8'
vim.opt.tabstop           = 4
vim.opt.shiftwidth        = 4
vim.opt.smartindent       = true
vim.opt.expandtab         = true
vim.opt.smarttab          = true
vim.opt.ignorecase        = true
vim.opt.smartcase         = true
vim.opt.hlsearch          = true
vim.opt.hidden            = true
vim.opt.showcmd           = true
vim.opt.title             = true
vim.opt.autoread          = true
vim.opt.lazyredraw        = true
vim.opt.ttyfast           = true
vim.opt.conceallevel      = 2 
vim.opt.showtabline       = 2
-- vim.opt.autochdir         = true

-- these two are know to cause slowdowns
vim.opt.relativenumber    = true
vim.opt.cursorline        = true
vim.opt.scrolloff         = 999
-- vim.opt.relativenumber    = false
-- vim.opt.cursorline        = false
-- vim.opt.scrolloff         = 0

-- file finding
vim.opt.path              = '**'
vim.opt.wildmenu          = true

-- spellcheck
vim.opt.spell             = true
vim.opt.spelllang         = 'en_us'

-- folding


-- whitespace
vim.opt.listchars         = 'tab:▸\\ ,space:·,eol:¬'
vim.opt.showbreak         = '>'

-- interaction
vim.opt.mouse             =
vim.opt.clipboard:append('unnamedplus')

require('keys')

EOF

let g:python3_host_prog = "/usr/bin/python3"
