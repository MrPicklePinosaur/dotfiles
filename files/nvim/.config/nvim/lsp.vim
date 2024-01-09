
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
                enable = true
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
-- cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer
lspconfig.wgsl_analyzer.setup{}

-- Diagonstic config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true
    }
)

-- TODO this is hardcoded path :(
-- local home = os.getenv('HOME')
-- local root_markers = {'gradlew', 'mvnw', '.git'}
-- local root_dir = require('jdtls.setup').find_root(root_markers)
-- local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
-- local config = {
--   root_dir = root_dir,
--   cmd = {
--     '/usr/lib/jvm/java-17-openjdk-amd64/bin/java',
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.protocol=true',
--     '-Dlog.level=ALL',
--     '-Xmx1g',
--     '--add-modules=ALL-SYSTEM',
--     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--     '-jar', '/home/pinosaur/Installs/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
--     '-configuration', '/home/pinosaur/Installs/jdtls/config_linux',
--     '-data', workspace_folder
--   },
--   settings = {
--     java = {
--       signatureHelp = { enabled = true },
--     }
--   }
-- }
-- require('jdtls').start_or_attach(config)

EOF

