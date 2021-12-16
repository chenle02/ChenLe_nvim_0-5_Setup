" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" The following is from https://calebeby.gitlab.io/blog/2016/formatting-markdown-tables-in-vim/
" visual select and <tab>
au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>
