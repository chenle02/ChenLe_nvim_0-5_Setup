autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
augroup my_cm_setup
  autocmd!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  autocmd Filetype tex call ncm2#register_source({
      \ 'name': 'vimtex',
      \ 'priority': 8,
      \ 'scope': ['tex'],
      \ 'mark': 'tex',
      \ 'word_pattern': '\w+',
      \ 'complete_pattern': g:vimtex#re#ncm2,
      \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
      \ })
augroup END
