-- FloaTerm configuration
vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")

-- NvimTree --
vim.keymap.set('n', "<leader>ff", ":NvimTreeToggle<CR>")

-- Fancy write markdown to PDF for dissemination --
vim.keymap.set('n', "<leader>w", ":!pandoc %:p --pdf-engine=xelatex --to=pdf -o ~/%:t:r.pdf<left><left><left>")
vim.keymap.set('n', "<leader>W", ":!pandoc %:p --pdf-engine=xelatex --to=pdf -o ~/%:t:r.pdf<cr>")

