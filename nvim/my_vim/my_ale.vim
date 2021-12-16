" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_enabled =0 " Disable ALE.
let g:ale_completion_enabled = 1
let g:ale_linters = {'python': ['pycodestyle']}
" The following works.
" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '.'
set omnifunc=ale#completion#OmniFunc
let g:ale_disable_lsp = 1
let g:ale_completion_tsserver_autoimport = 1
