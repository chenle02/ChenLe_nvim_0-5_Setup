augroup autocom
	autocmd!
	" executes my command on quit
	autocmd BufNewFile,BufRead /tmp/neomutt* set noautoindent filetype=tex.mail wm=0 tw=80 colorcolumn=80 number digraph nolist cursorline cursorcolumn relativenumber
	autocmd BufNewFile,BufRead /tmp/neomutt* noremap <leader><leader> :w<CR> :!/home/lechen/bin/email-process % <CR> :wq<CR>
	autocmd BufNewFile,BufRead /tmp/neomutt* noremap ;; :wq!<CR>
	autocmd BufNewFile,BufRead /tmp/neomutt* noremap ss :w!<CR> :!/home/lechen/bin/email-process % <CR> :e<CR>
	" The following is from
	" http://ianfinlayson.net/posts/10-mutt
	" autocmd VimLeave /tmp/neomutt-* !/home/lechen/bin/email-process %
augroup END

augroup Mutt
	au! BufRead /tmp/lechen-mutt-tmp/* source ~/.config/mutt/address-search.vim
augroup END

" Uncomment the following to have Vim jump to the last position when
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
