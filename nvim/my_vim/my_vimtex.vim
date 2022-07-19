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
" let  g:vimtex_fold_types = {
"        \ 'preamble' : {'enabled' : 1},
"        \ 'envs' : {
"        \   'blacklist' : ['align', 'eqnarray','array','matrix'],
"        \ },
"        \}
"
  let g:vimtex_fold_types = {}
  let g:vimtex_fold_types_defaults = {
        \ 'preamble' : {'enabled' : 1},
        \ 'items' : {'enabled' : 1},
        \ 'comments' : {'enabled' : 1},
        \ 'envs' : {
        \   'blacklist' : [],
        \   'whitelist' : [],
        \ },
        \ 'env_options' : {},
        \ 'markers' : {},
        \ 'sections' : {
        \   'parse_levels' : 0,
        \   'sections' : [
        \     '%(add)?part',
        \     '%(chapter|addchap)',
        \     '%(section|addsec)',
        \     'subsection',
        \     'subsubsection',
        \   ],
        \   'parts' : [
        \     'appendix',
        \     'frontmatter',
        \     'mainmatter',
        \     'backmatter',
        \   ],
        \ },
        \ 'cmd_single' : {
        \   'cmds' : [
        \     'hypersetup',
        \     'tikzset',
        \     'pgfplotstableread',
        \     'lstset',
        \   ],
        \ },
        \ 'cmd_single_opt' : {
        \   'cmds' : [
        \     'usepackage',
        \     'includepdf',
        \   ],
        \ },
        \ 'cmd_multi' : {
        \   'cmds' : [
        \     '%(re)?new%(command|environment)',
        \     'providecommand',
        \     'presetkeys',
        \     'Declare%(Multi|Auto)?CiteCommand',
        \     'Declare%(Index)?%(Field|List|Name)%(Format|Alias)',
        \   ],
        \ },
        \ 'cmd_addplot' : {
        \   'cmds' : [
        \     'addplot[+3]?',
        \   ],
        \ },
        \}

nnoremap <leader>tt :VimtexTocOpen<CR>
nnoremap <leader>t :VimtexTocToggle<CR>
