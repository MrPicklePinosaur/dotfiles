let g:jupyter_mapkeys = 0
let g:python3_host_prog = '/usr/bin/python'

" Run current file
nnoremap <buffer> <silent> <localleader>mr :JupyterRunFile<CR>
" nnoremap <buffer> <silent> <localleader>mi :PythonImportThisFile<CR>

" Change to directory of current file
" nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>

" Send a selection of lines
nnoremap <buffer> <silent> <localleader>mX :JupyterSendCell<CR>
nnoremap <buffer> <silent> <localleader>mE :JupyterSendRange<CR>
nmap     <buffer> <silent> <localleader>me <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <localleader>me <Plug>JupyterRunVisual

" Debugging maps
nnoremap <buffer> <silent> <localleader>mb :PythonSetBreak<CR>
