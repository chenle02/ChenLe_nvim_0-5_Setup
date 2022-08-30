" This is setup for vimwiki
" The prerequisites {{{
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_key_mappings = { 'table_mappings': 0, }
let g:vimwiki_list_ignore_newline = 0
" }}}
"{{{ Vimwiki projects go here.
"{{{ wiki_default
let wiki_default = {}
let wiki_default.path = '$HOME/Dropbox/vimwiki'
let wiki_default.template_path = '$HOME/Dropbox/vimwiki/templates'
let wiki_default.template_default =  'default'
let wiki_default.template_ext = '.html'
"}}}
"{{{ wiki_Math221_2020Fall
let wiki_Math221_2020Fall = {}
let wiki_Math221_2020Fall.path = '$HOME/Dropbox/Teaching/svn_teaching/2020_Fall_Math221/vimwiki'
let wiki_Math221_2020Fall.template_path = '$HOME/Dropbox/vimwiki/templates'
let wiki_Math221_2020Fall.template_default =  'Course'
let wiki_Math221_2020Fall.template_ext = '.html'
"}}}
"{{{ wiki_Math221_2021Spring
let wiki_Math221_2021Spring = {}
let wiki_Math221_2021Spring.path = '$HOME/Dropbox/Teaching/svn_teaching/2021_Spring_Math221/vimwiki'
let wiki_Math221_2021Spring.template_path = '$HOME/Dropbox/Teaching/svn_teaching/2021_Spring_Math221/vimwiki/templates/'
let wiki_Math221_2021Spring.template_default =  'Course'
let wiki_Math221_2021Spring.template_ext = '.html'
"}}}
"{{{ wiki_Math362_2021Spring
let wiki_Math362_2021Spring = {}
let wiki_Math362_2021Spring.path = '$HOME/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/vimwiki'
let wiki_Math362_2021Spring.template_path = '$HOME/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/vimwiki/templates/'
let wiki_Math362_2021Spring.template_default =  'Course'
let wiki_Math362_2021Spring.template_ext = '.html'
"}}}
"{{{ wiki_Math5870_2021Fall
let wiki_Math5870_2021Fall = {}
let wiki_Math5870_2021Fall.path = '$HOME/Dropbox/Teaching/svn_teaching/2021_Fall_Math5870/vimwiki'
let wiki_Math5870_2021Fall.template_path = '$HOME/Dropbox/Teaching/svn_teaching/2021_Fall_Math5870/vimwiki/templates/'
let wiki_Math5870_2021Fall.template_default =  'Course'
let wiki_Math5870_2021Fall.template_ext = '.html'
"}}}
"{{{ wiki_STAT3600_2021Fall
let wiki_STAT3600_2021Fall = {}
let wiki_STAT3600_2021Fall.path = '$HOME/Dropbox/Teaching/svn_teaching/2021_Fall_STAT3600/vimwiki'
let wiki_STAT3600_2021Fall.template_path = '$HOME/Dropbox/Teaching/svn_teaching/2021_Fall_STAT3600/vimwiki/templates/'
let wiki_STAT3600_2021Fall.template_default =  'Course'
let wiki_STAT3600_2021Fall.template_ext = '.html'
"}}}
"{{{ wiki_Math7210_2022Spring
let wiki_Math7210_2022Spring = {}
let wiki_Math7210_2022Spring.path = '$HOME/Dropbox/Teaching/svn_teaching/2022_Spring_Math7210/vimwiki'
let wiki_Math7210_2022Spring.template_path = '$HOME/Dropbox/Teaching/svn_teaching/2022_Spring_Math7210/vimwiki/templates/'
let wiki_Math7210_2022Spring.template_default =  'Course'
let wiki_Math7210_2022Spring.template_ext = '.html'
"}}}
"{{{ wiki_Math7800_2022Fall
let wiki_Math7800_2022Fall = {}
let wiki_Math7800_2022Fall.path = '$HOME/Dropbox/Teaching/svn_teaching/2022_Fall_Math7800/vimwiki'
let wiki_Math7800_2022Fall.template_path = '$HOME/Dropbox/Teaching/svn_teaching/2022_Fall_Math7800/vimwiki/templates/'
let wiki_Math7800_2022Fall.template_default =  'Course'
let wiki_Math7800_2022Fall.template_ext = '.html'
"}}}
"{{{ wiki_Math6030_2022Fall
let wiki_Math7000_2022Fall = {}
let wiki_Math7000_2022Fall.path = '$HOME/Dropbox/Teaching/svn_teaching/2022_Fall_Math7000/vimwiki'
let wiki_Math7000_2022Fall.template_path = '$HOME/Dropbox/Teaching/svn_teaching/2022_Fall_Math7000/vimwiki/templates/'
let wiki_Math7000_2022Fall.template_default =  'Course'
let wiki_Math7000_2022Fall.template_ext = '.html'
"}}}
"{{{ wiki_Math6030_2022Fall
let wiki_Math6030_2022Fall = {}
let wiki_Math6030_2022Fall.path = '$HOME/Dropbox/Teaching/svn_teaching/2022_Fall_Math6030/vimwiki'
let wiki_Math6030_2022Fall.template_path = '$HOME/Dropbox/Teaching/svn_teaching/2022_Fall_Math6030/vimwiki/templates/'
let wiki_Math6030_2022Fall.template_default =  'Course'
let wiki_Math6030_2022Fall.template_ext = '.html'
"}}}
"{{{ wiki_Auburn_Homepage
let wiki_Homepage = {}
let wiki_Homepage.path = '$HOME/Dropbox/workspace/svn/Job-applications/homepage/Auburn/vimwiki'
let wiki_Homepage.path_html = '$HOME/Dropbox/workspace/svn/Job-applications/homepage/Auburn/'
let wiki_Homepage.template_path = '$HOME/Dropbox/vimwiki/templates/'
let wiki_Homepage.template_default =  'Auburn'
let wiki_Homepage.template_ext = '.html'
"}}}
"{{{ wiki_R6_RalucaXia
" let wiki_R6_RalucaXia = {}
" let wiki_R6_RalucaXia.path = '$HOME/Dropbox/workspace/svn/Article-Feynman-Kac-Formula-FractionalBM/Rough-in-time-Xia/vimwiki'
" let wiki_R6_RalucaXia.template_path = '$HOME/Dropbox/vimwiki/templates'
" let wiki_R6_RalucaXia.template_default =  'Research'
" let wiki_R6_RalucaXia.template_ext = '.html'
"}}}
"{{{ wiki_TeachingTools
let wiki_TeachingTools = {}
let wiki_TeachingTools.path = '$HOME/Dropbox/Teaching/svn_teaching/Teaching_Tools'
let wiki_TeachingTools.template_path = '$HOME/Dropbox/vimwiki/templates'
let wiki_TeachingTools.template_default = 'Research'
let wiki_TeachingTools.syntax = 'markdown'
let wiki_TeachingTools.ext = '.md'
let wiki_TeachingTools.path_html = '$HOME/Dropbox/Teaching/svn_teaching/Teaching_Tools/site_html/'
let wiki_TeachingTools.custom_wiki2html = 'vimwiki_markdown'
let wiki_TeachingTools.auto_toc = 1
let wiki_TeachingTools.markdown_toc = 1
let wiki_TeachingTools.template_ext = '.tpl'
"}}}
"{{{ wiki_github_Homepage
let wiki_Github_Homepage = {}
let wiki_Github_Homepage.path = '$HOME/Dropbox/workspace/svn/chenle02.github.io/vimwiki'
let wiki_Github_Homepage.path_html = '$HOME/Dropbox/workspace/svn/chenle02.github.io/'
let wiki_Github_Homepage.template_path = '$HOME/Dropbox/vimwiki/templates/'
let wiki_Github_Homepage.template_default =  'Github'
let wiki_Github_Homepage.template_ext = '.html'
"}}}
let g:vimwiki_list = [
      \ wiki_default,
      \ wiki_Math7800_2022Fall,
      \ wiki_Math7000_2022Fall,
      \ wiki_Math7210_2022Spring,
      \ wiki_Homepage,
      \ wiki_Github_Homepage,
      \ ]
"}}}
"{{{ Other setups
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
      autocmd!
      " automatically update links on read diary
      autocmd BufNewFile ~/Dropbox/vimwiki/diary/*.wiki :silent 0r !~/bin/generate-vimwiki-diary-template '%:t'
      autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
command! VimwikiDiaryTemplate :silent 0r !~/bin/generate-vimwiki-diary-template '%:t'
command! VimwikiDiaryCal :silent r !vimwikical
command! Html w|VimwikiAll2HTML
autocmd FileType vimwiki nnoremap <leader><leader> :Html <CR>
autocmd FileType vimwiki nnoremap <leader>rr GG:r !~/bin/GenReview.lua <CR>
autocmd FileType vimwiki set foldmethod=syntax
autocmd FileType vimwiki let @u='di(F[a[|Pf]xf]a]da('
" To enable TableModeEnable in vimwiki"
" https://github.com/dhruvasagar/vim-table-mode/issues/110
" let g:vimwiki_table_mappings=0
" let g:vimwiki_table_auto_fmt=0
au! BufEnter,BufRead,BufNewFile *.wiki set filetype=vimwiki
" }}}
