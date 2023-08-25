
map L <nop>
nnoremap <silent> Ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> LD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> Lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> Li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> LR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> Lf <cmd>lua vim.lsp.buf.format({ async = true })<CR>
nnoremap <silent> LF <cmd>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent> La <cmd>lua vim.lsp.buf.code_action({ apply = true })<CR>
nnoremap <silent> Lq <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_next()<CR>

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
lspconfig.rust_analyzer.setup{
    settings = {
        ['rust-analyzer'] = {
            procMacro = {
                enable = false
            },
            checkOnSave = {
                enable = false
            },
        }
    }
}
lspconfig.pylsp.setup{}
lspconfig.solargraph.setup{}
lspconfig.zls.setup{}
-- npm install -g solidity-language-server
lspconfig.solidity_ls.setup{}

-- Diagonstic config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true
    }
)

EOF

