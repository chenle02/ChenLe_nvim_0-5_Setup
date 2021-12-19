-- require('glow').setup {}

vim.g.glow_border = "rounded"
vim.g.glow_binary_path = vim.env.HOME .. "/bin"
vim.g.glow_width = 120

vim.cmd([[
autocmd FileType md nmap <leader><leader> :Glow<CR>
au! BufEnter,BufRead,BufNewFile *.md set filetype=md
]])
