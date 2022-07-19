let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 2
let g:session_default_to_last = 1
let g:session_directory = "~/Dropbox/mydotfiles/vim-sessions/"
set sessionoptions-=help
nnoremap <leader>so :OpenSession <CR>
nnoremap <leader>ss :SaveSession<CR>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
