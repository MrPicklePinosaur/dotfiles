
nnoremap <silent><expr> <LocalLeader>m  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>mr :MagmaEvaluateLine<CR>
nnoremap <silent>       <LocalLeader>mi :MagmaInit python3<CR>
xnoremap <silent>       <LocalLeader>m  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>mc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>md :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>mo :MagmaShowOutput<CR>

let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"
" let g:magma_cell_highlight_group = "MatchParen"
