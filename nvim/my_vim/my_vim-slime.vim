let g:slime_target = 'tmux'
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
" let g:slime_dont_ask_default = 1 " Do not ask the configure
" let g:slime_target = 'vimterminal'
" Default keybindings repeated below
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
" nmap <c-c>v     <Plug>SlimeConfig
" Sync directory and open with vifm
function! SyncDirSlime()
  let l:cmdstr = "SlimeSend1 vifm ". expand("%:p:h")
  :echom l:cmdstr
  exec l:cmdstr
endfunction
nmap <c-c>f :call SyncDirSlime()<cr>
