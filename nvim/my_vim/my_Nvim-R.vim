" start R with F2 key
" map <F2> <Plug>RStart
" imap <F2> <Plug>RStart
" vmap <F2> <Plug>RStart
" R version can be specified like this:
let vimrplugin_r_path = "/usr/bin/R"
" Send selection or line to R with space bar, respectively.
autocmd FileType r nmap <Space> <Plug>RDSendSelection
autocmd FileType r vmap <Space> <Plug>RDSendSelection
" nmap <Space> :SlimeSendCurrentLine<CR>j
" Shortcut for R's assignment operator: 0 turns it off; 1 assigns underscore; 2 assigns two underscores
let R_assign = 2
" Ensures usage of your own ~/.tmux.conf file
" let R_notmuxconf = 1
" Shows function arguments in a separate viewport during omni completion with Ctrl-x Ctrl-o:w
" let R_show_args = 1
" let R_in_buffer = 0
" let R_tmux_split=1
let R_in_buffer = 0
let R_tmux_title = 'automatic'
let R_applescript = 0
let R_external_term = 'tilix -a session-add-right -e'
let R_csv_app = 'tmux new-window vd'
let R_source = '/home/lechen/.tmux/tmux_split.vim'

let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }
