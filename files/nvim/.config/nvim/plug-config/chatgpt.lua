require('chatgpt').setup{}

local k = vim.keymap

k.set("n", "<leader>aa", ":ChatGPT<cr>")
k.set("v", "<leader>at", ":ChatGPTRun add_tests<cr>")
k.set("v", "<leader>ad", ":ChatGPTRun docstring<cr>")
k.set("v", "<leader>ao", ":ChatGPTRun optimize_code<cr>")
k.set("v", "<leader>ae", ":ChatGPTRun explain_code<cr>")
k.set("v", "<leader>ab", ":ChatGPTRun fix_bugs<cr>")
