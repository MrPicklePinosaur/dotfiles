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

" toggle sign column

" clipboard
set clipboard+=unnamedplus

set mouse=

" includes
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/plug-config/plug.lua
source $HOME/.config/nvim/plug-config/cmp.vim
source $HOME/.config/nvim/plug-config/magma.vim
source $HOME/.config/nvim/plug-config/jupyter.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/neo-tree.vim
source $HOME/.config/nvim/plug-config/startup.lua

" lua << EOF
" vim.o.ch = 0
" EOF
