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

" includes
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/lsp.vim
