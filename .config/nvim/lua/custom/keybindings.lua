-- spellcheck activation
vim.keymap.set({'n','v'}, '<leader>o', ':setlocal spell! spelllang=es_ar<CR>')

-- replace all is aliased to S
vim.keymap.set({'n','v'}, 'S', ':%s///g<Left><Left><Left>')

-- Open corresponding .pdf/.html or preview
vim.keymap.set('n', '<leader>p', ':!opout <c-r>%<CR><CR>')

-- Save file as sudo on files that require root permission
vim.keymap.set('c', 'w!!', [[execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', '<leader>ww', ':VimwikiIndex<CR>')
