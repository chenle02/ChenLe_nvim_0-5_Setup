
let g:loaded_matchit = 1
" highlight MatchParen ctermbg=blue guibg=lightblue cterm=italic gui=italic
augroup matchup_matchparen_highlight
  autocmd!
  " autocmd ColorScheme * hi MatchParen guifg=red guibg=blue
  autocmd ColorScheme * hi MatchParen guifg=red
augroup END
