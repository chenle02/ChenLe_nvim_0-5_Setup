command! -nargs=1 AbookQuery call <sid>AbookQuery(<f-args>)
inoremap <script> <leader># <esc>:call <sid>AbookQueryINS()<cr>
inoremap <script> <leader>@ <esc>:call <sid>AbookQueryINSshort()<cr>
