
vim.g.mapleader = " "

local k = vim.keymap

-- editor
k.set("n", "<leader>r", ":source ~/.config/nvim/init.vim<cr>:echo 'init.vim reloaded'<cr>")
k.set("n", "<leader>e", ":e<cr>:echo 'current file reloaded'<cr>")
k.set("n", "<leader>E", ":e!<cr>:echo 'current file force reloaded'<cr>")

-- movement
k.set("n", "Y", "y$")
k.set("n", "<C-K>", ":m -2<cr>", { desc = "move line up" })
k.set("n", "<C-J>", ":m +1<cr>", { desc = "move line down" })

-- file operations
k.set("n", "<leader>w", ":w<cr>", { desc = "write file" })
k.set("n", "<leader>q", ":qa<cr>", { desc = "close nvim" })

-- buffers
k.set("n", "<leader>l", ":bn<cr>", { desc = "move to next buffer" })
k.set("n", "<leader>h", ":bp<cr>", { desc = "move to previous buffer" })
k.set("n", "<leader>d", ":bd<cr>", { desc = "close buffer" })

-- tabs
-- k.set("n", "<leader>l", ":tabnext<cr>", { desc = "move to next tab" })
-- k.set("n", "<leader>h", ":tabprevious<cr>", { desc = "move to previous tab" })

-- windows
k.set("n", "<leader>v", "<C-w>v", { desc = "create vertical split" })
k.set("n", "<leader>L", "<C-w>l", { desc = "move to split on left" })
k.set("n", "<leader>H", "<C-w>h", { desc = "move to split on right" })

-- spellcheck
k.set("n", "<C-s>f", "1z=<cr>", { desc = "" })
k.set("n", "<C-s>n", "]s", { desc = "" })
k.set("n", "<C-s>N", "[s", { desc = "" })
k.set("n", "<C-s>a", "zg", { desc = "" })
k.set("n", "<C-s>d", "zw", { desc = "" })

-- misc
k.set("n", "<leader>/", ":noh<cr>", { desc = "clear search highlight" })
k.set("n", "<leader>s", ":set list!<cr>", { desc = "show whitespace marker characters" })

