"          _                    
"   __   _(_)_ __ ___  _ __ ___ 
"   \ \ / / | '_ ` _ \| '__/ __|
"    \ V /| | | | | | | | | (__ 
"   (_)_/ |_|_| |_| |_|_|  \___|
"   pinosaur's vim config

" basics
syntax on
set nocompatible
set number
set relativenumber
set incsearch
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
set smarttab
set ignorecase
set smartcase
set hlsearch
set hidden
set showcmd
set title
set autoread
set cursorline "this is set only to enable color theme on current line number

" location of vim meta files
set directory^=$HOME/.cache/vimswap// " swap location
" set viminfo+=n~/.vim/viminfo

" cursors depending on mode
let &t_EI = "\<Esc>[2 q" "normal mode
let &t_SI = "\<Esc>[6 q" "insert mode
let &t_SR = "\<Esc>[4 q" "replace mode

" default key remaps
map Y y$

" conceal
set conceallevel=2

" Bindings
let mapleader = ' '

" netrw stuff
" map <leader>f :Lex<cr>
map <leader>f :Ex<cr>
map <leader>l :bn<cr>
map <leader>h :bp<cr>
map <leader>d :bd<cr>

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" let g:netrw_browse_split=4

" keep cursor position after switching buffer (prob useless after adding scrolloff
autocmd BufEnter * silent! normal! g`"
set scrolloff=999

" clear search hl
map <leader>/ :noh<cr>

" file finding
set path=**
set wildmenu

" spell check
setlocal spell
set spelllang=en_us
set spellcapcheck=

" use s as prefix for spell check related commands
" map s <nop>
" map sf 1z=<cr>
" map sn ]s
" map sN [s
" map sa zg
" map sd zw

" folding
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2

" toggle fold column
" map <leader>z :set foldcolumn=1

" remember all folds
augroup remember_folds
    autocmd!
    " autocmd BufWinLeave * mkview " causing issues
    autocmd BufWinEnter * silent! loadview
augroup END
" TODO: possible an indicator on number of folds in status bar

" abbrv / commands
command -nargs=1 Syn :set syntax=<args>

" View whitespace
map <leader>s :set list!<cr>
set listchars=tab:▸\ ,space:·,eol:¬
set showbreak=>

" 80-char column - TODO: add toggle
" hi ColorColumn ctermbg=black
hi ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" write with sudo
cmap w!! w !sudo tee > /dev/null %

" reload vimrc
if has('nvim')
map <leader>r :source ~/.config/nvim/init.vim<cr>:echo "init.vim reloaded"<cr>
else
map <leader>r :source ~/.vimrc<cr>:echo "vimrc reloaded"<cr>
endif

" reload current file
map <leader>e :e<cr>:echo "current file reloaded"<cr>
map <leader>E :e!<cr>:echo "current file force reloaded"<cr>

" auto set syntax given filenames
augroup syntaxhighlight
    autocmd!
    autocmd BufRead,BufNewFile commonrc set syntax=sh 
    autocmd BufRead,BufNewFile commonprofile set syntax=sh 
augroup END

" Templates
augroup templates
    autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
    autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
    autocmd BufNewFile *.rkt 0r ~/.vim/templates/skeleton.rkt
    autocmd BufNewFile *.xml 0r ~/.vim/templates/skeleton.xml
    autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
augroup END

" highlighting (will get rid of this sometime prob)
au BufRead,BufNewFile *.svelte set filetype=svelte
au! Syntax svelte source ~/.vim/syntax/svelte.vim

au BufRead,BufNewFile *.shader set filetype=glsl
au! Syntax shader source ~/.vim/syntax/glsl.vim

au BufRead,BufNewFile *.shader set filetype=241
au! Syntax 241 source ~/.vim/syntax/241.vim

au BufRead,BufNewFile *.hs set filetype=haskell
au! Syntax haskell source ~/.vim/syntax/haskell.vim

" vim plug
" this blob auto installs vim plug if it isnt already
fun! s:VimPlugSetup()
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    else
        echo 'VimPlug is already installed'
    endif
endfun
command PlugSetup :call s:VimPlugSetup()

" template stuff
call plug#begin('~/.vim/plugged')

if !has('nvim')
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
" Plug 'lervag/vimtex', { 'for': 'tex' }
" Plug 'PietroPate/vim-tex-conceal', { 'for': 'tex' }
" Plug 'takac/vim-hardtime'
Plug 'vimwiki/vimwiki'
endif

call plug#end()

" leader for plugins
let maplocalleader = "\\"

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["mysnippets"]

map <localleader>sr :call UltiSnips#RefreshSnippets()<cr>:echo "Refreshed Snippets"<cr>

" Vimtex
" let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
" let g:vimtex_quickfix_mode=0
" let g:tex_conceal='abdmgs'
" 
" let g:vimtex_compiler_latexmk = {
"     \'build_dir': '/home/pinosaur/.cache/latexaux/',
" \}
"     " \'options': [
"     " \   '-shell-escape',
"     " \],

" buftabline
let g:buftabline_show = 1

" hardtime
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 2

" vimwiki
let g:vimwiki_list = [{'path': '~/Data/vimwiki'}]

" Run after plugins
autocmd FileType * set formatoptions-=o

colorscheme pino
