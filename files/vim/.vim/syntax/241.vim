" Language: CS241 Dialect MIPS assembly
" Maintainer: 

if exists("b:current_syntax") && b:current_syntax == "241"
    finish
endif

syn keyword asmInstruction add sub mult multu div divu mfhi mflo lis lw sw slt sltu beq bne jr jalr
syn keyword asmWord .word
syn match asmComment "#.*$"

let b:current_syntax = "241"
hi def link asmInstruction Function
hi def link asmWord Label
hi def link asmComment Comment
