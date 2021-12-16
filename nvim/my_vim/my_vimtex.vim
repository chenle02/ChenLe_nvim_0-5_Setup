" my settings for vimtex
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_fold_enabled=1
let g:tex_flavor = 'latex'
" TOC settings
" let g:vimtex_toc_config = {
" \ 'name' : 'TOC',
" \ 'layers' : ['content', 'todo', 'include'],
" \ 'resize' : 1,
" \ 'split_width' : 50,
" \ 'todo_sorted' : 0,
" \ 'show_help' : 1,
" \ 'show_numbers' : 1,
" \ 'mode' : 2,
" \}
let  g:vimtex_fold_types = {
       \ 'preamble' : {'enabled' : 1},
       \ 'envs' : {
       \   'blacklist' : ['align', 'eqnarray','array','matrix'],
       \ },
       \}
nnoremap <leader>tt :VimtexTocOpen<CR>
nnoremap <leader>t :VimtexTocToggle<CR>
