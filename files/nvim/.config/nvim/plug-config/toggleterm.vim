
lua << EOF

require'toggleterm'.setup {
    direction = 'float',
    auto_scroll = true,
    open_mapping = [[<c-\>]],
    shell = 'bash',
    float_opts = {
        border = 'curved'
    },
}

EOF

