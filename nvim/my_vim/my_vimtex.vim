" my settings for VimTex

filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer  = 'zathura'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

" let g:vimtex_view_general_options_latexmk = '-reuse-instance'
" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".

let g:vimtex_compiler_method = 'tectonic'
let g:vimtex_compiler_tectonic = {
  \ 'build_dir' : '',
  \ 'options' : [
  \   '--keep-logs',
  \   '--keep-intermediates',
  \   '--synctex'
  \ ],
  \}

" Quickfix window relategh repo clone nspring/style-checkd
" Open quickfix window on errors
let g:vimtex_quickfix_mode = 0
autocmd FileType tex noremap <silent> ,b :VimtexErrors<CR>:normal <ctrl-w>w<CR>
nnoremap <silent> ,n :cnext<CR>:normal zz<CR>
nnoremap <silent> ,m :cprevious<CR>:normal zz<CR>

nnoremap <leader>tt :VimtexTocOpen<CR>
nnoremap <leader>t :VimtexTocToggle<CR>

" Set up yalafi for grammar
" pip install --user yalafi
" It works but not very impressive, one cannot stay in vim.
" sudo snap install languagetool
" let g:vimtex_grammar_vlty = {'lt_command': 'languagetool'}

set spelllang=en_gb
let g:vimtex_grammar_vlty = {
      \ 'lt_directory': '/home/lechen/.local/share/nvim/lsp_servers/ltex/ltex-ls-15.2.0/lib',
      \ 'lt_command': '',
      \ 'lt_disable': 'WHITESPACE_RULE',
      \ 'lt_enable': '',
      \ 'lt_disablecategories': '',
      \ 'lt_enablecategories': '',
      \ 'server': 'yes',
      \ 'shell_options': '',
      \ 'show_suggestions': 1,
      \ 'encoding': 'auto',
      \}

" Now try another grammar tool -- textidote
let g:vimtex_grammar_textidote = {'jar': '/opt/textidote/textidote.jar'}

" Latex documentation
" Use K to open
let g:vimtex_doc_handlers = ['vimtex#doc#handlers#texdoc']

" Toggle math
let g:vimtex_env_toggle_math_map = {
      \ '$' : 'align*',
      \ '$$': 'align*',
      \ '\[': 'align*',
      \ '\(': '$',
      \}

" fzf
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>

" Folding
let g:vimtex_fold_enabled = 1
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

