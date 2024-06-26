
" TODO make <leader>f open in current buffer and <leader>F open in new tab

nnoremap <leader>F <cmd>Telescope find_files<cr>
nnoremap <leader>G <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

" LSP
nnoremap Lr <cmd>Telescope lsp_references<cr>
nnoremap Ls <cmd>Telescope lsp_document_symbols<cr>
nnoremap LS <cmd>Telescope lsp_workspace_symbols<cr>

lua << EOF

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
--        hidden = "true",
    },
    live_grep = {
        theme = "dropdown",
        layout_strategy = 'center',
        layout_config = {
          width = 0.7
        },
    }
  },
  extensions = {
    frecency = {

    }
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
EOF

