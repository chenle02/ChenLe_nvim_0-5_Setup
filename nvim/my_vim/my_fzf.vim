" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Empty value to disable preview window altogether
" let g:fzf_preview_window = ''
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_preview_command = 'bat --color=always --plain {-1}'

" The following three lines are from
" https://www.erickpatrick.net/blog/adding-syntax-highlighting-to-fzf.vim-preview-window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'

command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Word completion using fzf insert mode completion: Either of the following two
" works equally.
" https://www.reddit.com/r/vim/comments/gr8fhj/fzfvimcompleteword_with_words_from_open_buffers/
" 1. The following using <F1> to bring up completion candidates in fzf interface
inoremap <expr> <F1> fzf#vim#complete({'source': map(complete_info().items, "v:val.word")})
" 2. https://vim.fandom.com/wiki/Fuzzy_insert_mode_completion_(using_FZF)
" function! PInsert2(item)
" 	let @z=a:item
" 	norm "zp
" 	call feedkeys('a')
" endfunction
" function! CompleteInf()
" 	let nl=[]
" 	let l=complete_info()
" 	for k in l['items']
" 		call add(nl, k['word']. ' : ' .k['info'] . ' '. k['menu'] )
" 	endfor
" 	call fzf#vim#complete(fzf#wrap({ 'source': nl,'reducer': { lines -> split(lines[0], '\zs :')[0] },'sink':function('PInsert2')}))
" endfunction
" imap <F2> <CMD>:call CompleteInf()<CR>
