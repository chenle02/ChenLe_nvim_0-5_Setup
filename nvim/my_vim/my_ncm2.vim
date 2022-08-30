autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" augroup my_cm_setup
"   autocmd!
"   autocmd BufEnter * call ncm2#enable_for_buffer()
"   autocmd Filetype tex call ncm2#register_source({
"           \ 'name' : 'vimtex-cmds',
"           \ 'priority': 8,
"           \ 'complete_length': -1,
"           \ 'scope': ['tex'],
"           \ 'matcher': {'name': 'prefix', 'key': 'word'},
"           \ 'word_pattern': '\w+',
"           \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"           \ })
"   autocmd Filetype tex call ncm2#register_source({
"           \ 'name' : 'vimtex-labels',
"           \ 'priority': 8,
"           \ 'complete_length': -1,
"           \ 'scope': ['tex'],
"           \ 'matcher': {'name': 'combine',
"           \             'matchers': [
"           \               {'name': 'substr', 'key': 'word'},
"           \               {'name': 'substr', 'key': 'menu'},
"           \             ]},
"           \ 'word_pattern': '\w+',
"           \ 'complete_pattern': g:vimtex#re#ncm2#labels,
"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"           \ })
"   autocmd Filetype tex call ncm2#register_source({
"           \ 'name' : 'vimtex-files',
"           \ 'priority': 8,
"           \ 'complete_length': -1,
"           \ 'scope': ['tex'],
"           \ 'matcher': {'name': 'combine',
"           \             'matchers': [
"           \               {'name': 'abbrfuzzy', 'key': 'word'},
"           \               {'name': 'abbrfuzzy', 'key': 'abbr'},
"           \             ]},
"           \ 'word_pattern': '\w+',
"           \ 'complete_pattern': g:vimtex#re#ncm2#files,
"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"           \ })
"   autocmd Filetype tex call ncm2#register_source({
"           \ 'name' : 'bibtex',
"           \ 'priority': 8,
"           \ 'complete_length': -1,
"           \ 'scope': ['tex'],
"           \ 'matcher': {'name': 'combine',
"           \             'matchers': [
"           \               {'name': 'prefix', 'key': 'word'},
"           \               {'name': 'abbrfuzzy', 'key': 'abbr'},
"           \               {'name': 'abbrfuzzy', 'key': 'menu'},
"           \             ]},
"           \ 'word_pattern': '\w+',
"           \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"           \ })
" augroup END
