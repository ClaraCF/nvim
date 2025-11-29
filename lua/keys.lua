-- FloaTerm configuration
vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")

-- NvimTree --
vim.keymap.set('n', "<leader>ff", ":NvimTreeToggle<CR>")

-- LSP Code Actions --
vim.keymap.set('n', "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
