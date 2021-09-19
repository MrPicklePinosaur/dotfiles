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
set ignorecase
set smartcase
set hidden
set showcmd
" set cursorline

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
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" keep cursor position after switching buffer (prob useless after adding scrolloff
autocmd BufEnter * silent! normal! g`"
set scrolloff=999

" file finding
set path=**
set wildmenu

" spell check
setlocal spell
set spelllang=en_us
set spellcapcheck=

" use s as prefix for spell check related commands
map s <nop>
map sf 1z=<cr>
map sn ]s
map sN [s
map sa zg
map sd zw

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
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
" TODO: possible an indicator on number of folds in status bar

" tags
set tags=.tags
" todo, regenerate tags
" probably do the following
" - check if tags file already exists
" - if it does, then regenerate it on every save
" - otherwise, provide a function to generate tags for the first time

" View whitespace
map <leader>s :set list!<cr>
set listchars=tab:▸\ ,space:·,eol:¬

" reload vimrc
map <leader>r :source ~/.vimrc<cr>:echo "vimrc reloaded"<cr>

" write with sudo
cmap w!! w !sudo tee > /dev/null %

" reload current file
map <leader>e :e<cr>:echo "current file reloaded"<cr>
map <leader>E :e!<cr>:echo "current file force reloaded"<cr>

" statusline
function! StatusModeColor()
    if (mode() =~# '\v(n|no)')
        hi StatusLine cterm=None gui=None ctermfg=black ctermbg=Yellow
    elseif (mode() =~# '\v(v|V|)')
        hi StatusLine cterm=None gui=None ctermfg=black ctermbg=Red
    elseif (mode() ==# 'i')
        hi StatusLine cterm=None gui=None ctermfg=black ctermbg=LightBlue
    elseif (mode() ==# 'c') 
        hi StatusLine cterm=None gui=None ctermfg=black ctermbg=Green
    else
        hi StatusLine cterm=None gui=None ctermfg=black ctermbg=DarkGrey
    endif
endfunction

function! StatusModifiedColor()
    if &mod
        hi User1 cterm=None gui=None ctermfg=Black ctermbg=Magenta
    else
        hi User1 cterm=None gui=None ctermfg=White ctermbg=Black
    endif
endfunction

function! ReloadBar()
    call StatusModeColor()
    call StatusModifiedColor()
    return ''
endfunction

function! BufCount()
    return printf("%d/%d", bufnr("%"), len(getbufinfo({'buflisted':1})))
endfunction

autocmd BufEnter * call ReloadBar()
autocmd BufWritePost <buffer> call ReloadBar()

set laststatus=2
set statusline=
set statusline+=%{ReloadBar()}
set statusline+=%1*\ | 
set statusline+=%0*\ vim\ \[%{mode()}\]
set statusline+=\[%{BufCount()}\]
set statusline+=\ %1*\ %{expand('%:~:.')}\ %m
set statusline+=%=
set statusline+=%y
set statusline+=\ %0*
set statusline+=\ %r\[%{v:register}\]
set statusline+=\ %l/%L:%c\ |
set statusline+=%1*\ |

" Templates
augroup templates
    autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
    autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
    autocmd BufNewFile *.rkt 0r ~/.vim/templates/skeleton.rkt
    autocmd BufNewFile *.xml 0r ~/.vim/templates/skeleton.xml
augroup END

" highlighting (will get rid of this sometime prob)
au BufRead,BufNewFile *.svelte set filetype=svelte
au! Syntax svelte source ~/.vim/syntax/svelte.vim

au BufRead,BufNewFile *.shader set filetype=glsl
au! Syntax shader source ~/.vim/syntax/glsl.vim

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

Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'PietroPate/vim-tex-conceal', { 'for': 'tex' }
" Plug 'takac/vim-hardtime'

call plug#end()

" leader for plugins
let maplocalleader = "\\"

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

map <localleader>sr :call UltiSnips#RefreshSnippets()<cr>:echo "Refreshed Snippets"<cr>

" latex stuff
" fun! LatexCompile()
"     echo 'compiling latex'
" endfun
" augroup latex
"     autocmd!
"     autocmd BufWritePost *.tex :call LatexCompile()
" augroup END

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmgs'

let g:vimtex_compiler_latexmk = {
    \'build_dir': '/home/pinosaur/.cache/latexaux/',
\}
    " \'options': [
    " \   '-shell-escape',
    " \],

" buftabline
let g:buftabline_show = 1

" hardtime
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 2

" Run after plugins
autocmd FileType * set formatoptions-=o

" colors
" based off https://github.com/jeffkreeftmeijer/vim-dim/blob/main/colors/default-light.vim
hi SpecialKey     ctermfg=4
hi TermCursor     cterm=reverse
hi NonText        ctermfg=12
hi Directory      ctermfg=4
hi ErrorMsg       ctermfg=15 ctermbg=1
hi IncSearch      cterm=reverse
hi MoreMsg        ctermfg=2
hi ModeMsg        cterm=bold
hi Question       ctermfg=2
hi Title          ctermfg=5
hi WarningMsg     ctermfg=1
hi WildMenu       ctermfg=0 ctermbg=11
hi Conceal        ctermbg=0
hi SpellBad       ctermfg=9 ctermbg=0 cterm=underline
hi SpellRare      ctermbg=13 ctermbg=0 cterm=underline
hi SpellLocal     ctermfg=14 ctermbg=0 cterm=underline
hi PmenuSbar      ctermbg=8
hi PmenuThumb     ctermbg=0
hi CursorColumn   ctermbg=7
hi CursorLine     cterm=NONE ctermbg=DarkGrey
hi MatchParen     cterm=NONE ctermbg=DarkGrey
hi Constant       ctermfg=1
hi Special        ctermfg=5
hi Identifier     cterm=NONE ctermfg=6
hi Statement      ctermfg=3
hi PreProc        ctermfg=5
hi Type           ctermfg=2
hi Underlined     cterm=underline ctermfg=5
hi Ignore         ctermfg=15
hi Error          ctermfg=15 ctermbg=9
hi Todo           ctermfg=0 ctermbg=11
hi Comment        ctermfg=DarkGrey
hi lineNr         ctermfg=DarkGrey
hi Folded         ctermfg=0
hi Pmenu          ctermfg=0 ctermbg=7
hi PmenuSel       ctermfg=0 ctermbg=6
hi TabLineSel     cterm=Bold ctermfg=Yellow
hi TabLine        cterm=None ctermfg=Grey ctermbg=Black
hi TabLineFill    cterm=None ctermbg=Black

