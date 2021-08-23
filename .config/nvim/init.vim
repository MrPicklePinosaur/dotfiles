
syntax on
set number
set relativenumber
set incsearch
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set hidden

" cursors depending on mode
let &t_EI = "\<Esc>[2 q" "normal mode
let &t_SI = "\<Esc>[6 q" "insert mode
let &t_SR = "\<Esc>[4 q" "replace mode

" conceal
set conceallevel=2

" Bindings
let mapleader = ' '

" netrw stuff
map <leader>f :Ex<cr>
map <leader>l :bn<cr>
map <leader>h :bp<cr>
map <leader>d :bd<cr>

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" file finding
set path=**
set wildmenu

" folding
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2

" View whitespace
map <leader>s :set list!<cr>
set listchars=tab:▸\ ,space:·,eol:¬

" reload vimrc
map <leader>r :source ~/.config/nvim/init.vim<cr>:echo "init.vim reloaded"<cr>

" write with sudo
cmap w!! w !sudo tee > /dev/null %

" reload current file
map <leader>e :e<cr>:echo "current file reloaded"<cr>
map <leader>E :e!<cr>:echo "current file force reloaded"<cr>

" toggle sign column


" clipboard
set clipboard+=unnamedplus

" includes
source $HOME/.config/nvim/bar.vim
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/colors.vim
