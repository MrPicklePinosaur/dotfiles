"          _                    
"   __   _(_)_ __ ___  _ __ ___ 
"   \ \ / / | '_ ` _ \| '__/ __|
"    \ V /| | | | | | | | | (__ 
"   (_)_/ |_|_| |_| |_|_|  \___|
"                            

syntax on
set number
set relativenumber
set hlsearch
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set formatoptions-=cro "disables auto comments

setlocal spell
set spelllang=en_us
set spellcapcheck=

set conceallevel=2

" colors
hi Conceal ctermbg=Black
hi SpellBad ctermfg=Red ctermbg=Black cterm=underline

" Bindings
nnoremap <C-[> <C-t>

" Some macros

" vim plug
" this blob auto installs vim plug if it isnt already
if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
         autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
         endif

call plug#begin('~/.vim/plugged')

Plug 'sirver/ultisnips'
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'PietroPate/vim-tex-conceal'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'habamax/vim-godot'
Plug 'tpope/vim-commentary'

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
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" Ctrlp
let g:ctrlp_cmd='CtrlPTag'
