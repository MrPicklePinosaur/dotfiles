
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

lua << EOF
local lspconfig = require'lspconfig'

-- npm install -g typescript typescript-language-server vscode-langservers-extracted
lspconfig.tsserver.setup{}
lspconfig.ccls.setup{}
lspconfig.html.setup{}
lspconfig.cssls.setup{}
lspconfig.gopls.setup{}
lspconfig.eslint.setup{}
lspconfig.hls.setup{}
lspconfig.rust_analyzer.setup{}

-- disable virtual error 
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
EOF

