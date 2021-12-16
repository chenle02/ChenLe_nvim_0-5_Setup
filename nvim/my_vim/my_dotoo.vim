let g:dotoo#agenda#files = ['~/Dropbox/dotoo-files/*.dotoo']

let g:dotoo_headline_highlight_colors = [
                \ 'Title',
                \ 'Constant',
                \ 'Identifier',
                \ 'Statement',
                \ 'PreProc',
                \ 'Type',
                \ 'Special']

" autocmd BufEnter *.dotoo colorscheme dracula
" autocmd BufLeave *.dotoo colorscheme one

autocmd BufEnter *.dotoo colorscheme badwolf
autocmd BufLeave *.dotoo colorscheme one

" autocmd BufEnter *.dotoo :set background=light
" autocmd BufLeave *.dotoo :set background=dark

let g:dotoo_todo_keyword_faces = [
  \ ['TODO', [':foreground 160', ':weight bold']],
  \ ['NEXT', [':foreground 27', ':weight bold']],
  \ ['DONE', [':foreground 22', ':weight bold']],
  \ ['WAITING', [':foreground 202', ':weight bold']],
  \ ['HOLD', [':foreground 53', ':weight bold']],
  \ ['CANCELLED', [':foreground 22', ':weight bold']],
  \ ['MEETING', [':foreground 22', ':weight bold']],
  \ ['PHONE', [':foreground 22', ':weight bold']]
  \ ]

hi dotoo_shade_stars ctermfg=white guifg='#000000'

map <silent>gD :e ~/Dropbox/dotoo-files<CR>
