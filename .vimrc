"          _                    
"   __   _(_)_ __ ___  _ __ ___ 
"   \ \ / / | '_ ` _ \| '__/ __|
"    \ V /| | | | | | | | | (__ 
"   (_)_/ |_|_| |_| |_|_|  \___|
"                            

" basics
syntax on
set number
set relativenumber
set incsearch
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab

" spell check
setlocal spell
set spelllang=en_us
set spellcapcheck=

" conceal
set conceallevel=2

" Bindings
let mapleader = ' '

" map <leader>e :Ex<cr>
" map <leader>v :Vex<cr>
map <leader>l :bn<cr>
map <leader>h :bp<cr>
map <leader>d :bd<cr>

" colors
hi Conceal ctermbg=Black
hi SpellBad ctermfg=Red ctermbg=Black cterm=underline

" Netrw
" let g:netrw_liststyle = 3
" let g:netrw_banner = 0
" let g:netrw_winsize = 25
" let g:netrw_browse_split = 4

" Templates
augroup templates
    autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
    autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
    autocmd BufNewFile *.rkt 0r ~/.vim/templates/skeleton.rkt
augroup END

" vim plug
" this blob auto installs vim plug if it isnt already
if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
         autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
         endif

" template stuff
call plug#begin('~/.vim/plugged')

Plug 'sirver/ultisnips'
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'PietroPate/vim-tex-conceal'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ptzz/lf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'habamax/vim-godot'

call plug#end()

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmgs'

let g:vimtex_compiler_latexmk = {
    \'build_dir': '/home/pinosaur/.cache/latexaux/',
\}

" VimAirline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_powerline_fonts=1

" Ctrlp
let g:ctrlp_cmd='CtrlPTag'

" Lf
" let g:lf_replace_netrw = 1 " weird behavior rn

" Run after plugins
autocmd FileType * set formatoptions-=o
