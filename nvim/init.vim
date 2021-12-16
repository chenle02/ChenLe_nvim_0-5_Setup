""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Le Chen's nvim config: ~/.config/nvim/init.vim
"""""""""""""""""""""" """""""""""""""""""""""""""""""
" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3
"{{{ Preferred basic settings:
" Fixes weird character problem in some devel versions neovim under tmux sesssion. This might go away in future.
set guicursor=

set foldmethod=marker
let g:python3_host_prog = '/usr/local/bin/python3'
set nowrap
set spell
set spelllang=en
set spellfile=$HOME/Dropbox/mydotfiles/my_vim/spell/en.utf-8.add
set guioptions+=a
set laststatus=2
set cursorline
set cursorcolumn
set colorcolumn=+2
set shiftwidth=2
set splitbelow
set splitright
set autochdir
set timeoutlen=800
set backspace=0

" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set grepprg=rg\ --vimgrep
" The following is to copy to clipboard
set clipboard=unnamedplus
" The following is for tex_conceal
" set conceallevel=2

" set line number
set relativenumber
set number
set textwidth=100
set t_Co=256
set background=dark
" Remove white background of status line at bottom of nvim viewport (default is 2)

set nocompatible              " be iMproved, required
filetype on                   " required
syntax on " required"

set laststatus=2
" set encoding=UTF-8
set autoread

" let g:ruby_host_prog = '/home/lechen/.rvm/rubies/ruby-2.7.1/bin/ruby'
" let g:ruby_host_prog = '/usr/bin/ruby'
let g:ruby_host_prog = '/usr/bin/ruby2.7'

nnoremap qw :wq!<cr>
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let g:python3_host_prog = '/usr/bin/python3'
let g:pymode_lint_ignore = ["E501"]
"{{{ Some setup for the temporary files
" https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//"
" }}}
"}}}
"{{{ Automatically install missing plugins on startup
autocmd VimEnter *
\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
\|   PlugInstall --sync | q
\| endif
" }}}
"{{{ Some of my key bindings
" Use Ctrl-Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" The following is for spelling by choosing the first hit
nnoremap ]ss ]sz=1<cr><cr>
nnoremap [ss [sz=1<cr><cr>

" the following is to automatically remove trailing white spaces
" https://vim.fandom.com/wiki/Remove_unwanted_spaces
" autocmd FileType tex,vimwiki,mail autocmd BufWritePre * %s/\s\+$//e
nnoremap <leader>s mm:%s/\s\+$//e<cr>'m

" Insert blank line above or below in the normal mode.
" https://vi.stackexchange.com/questions/3875/how-to-insert-a-newline-without-leaving-normal-mode
nnoremap <silent> oo :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> OO :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

nnoremap <leader>] :e #<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q!<CR>
nnoremap .m :set foldmethod=marker<CR>
" Insert new line without leaving Normal mode
" nnoremap <Leader>o o<Esc>
" nnoremap <Leader>O O<Esc>
" nmap <S-Enter> O<Esc>
" nmap <CR> o<Esc>

" The following is to input date and time by <F10>
" https://vim.fandom.com/wiki/Insert_current_date_or_time
nnoremap <F10> "=strftime("%Y-%m-%d %a %H:%M:%S")<CR>P
inoremap <F10> <C-R>=strftime("%Y-%m-%d %a %H:%M:%S")<CR>

" Map <leader> + 1-9 to jump to respective tab
let i = 1
while i < 10
  execute ":nmap <leader>" . i . " :tabn " . i . "<CR>"
  let i += 1
endwhile

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Visual move lines upwards or downwards
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" nnoremap <C-p> :GFiles<CR>
" nnoremap // :BLines<CR>
" nnoremap <leader>[ :FzfPreviewAllBuffers<CR>
nnoremap <leader>l :FzfPreviewBufferLines<CR>
" nnoremap <leader>[ :Buffers<CR>


" The following to lines really delete things without cut.
nnoremap <leader>d "_d
xnoremap <leader>d "_d
" Do not pollute my buffer by pasting
vnoremap <leader>p "_dP

nnoremap <leader>o :only<cr>
nnoremap <space><space> za
" {{{ toggle conceal level
" https://github.com/tpope/vim-unimpaired/issues/105
nnoremap =oe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
nnoremap [oe :setlocal conceallevel=<c-r>=&conceallevel > 0 ? &conceallevel - 1 : 0<cr><cr>
nnoremap ]oe :setlocal conceallevel=<c-r>=&conceallevel < 2 ? &conceallevel + 1 : 2<cr><cr>
"}}}
" Close all buffers except the current one
" https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one
noremap <leader>bd :%bd\|e#\|bd#<cr>\|'"

nnoremap gqp vip<CR>gqq<CR>
nnoremap br A<br><Esc>'.

nnoremap <leader>sop :source %<cr>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>el :vsplit  ~/.config/nvim/my_vim/LatexProject.vim<cr>
inoremap jk <esc>

"So I can move around in insert
" inoremap <C-k> <C-o>gk
" inoremap <C-h> <Left>
inoremap <C-b> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-d> <end>

" Here is an attempt to make vim more responsive
" set nocursorline
" set nocursorcolumn
" set scrolljump=5
" set lazyredraw
" set synmaxcol=180

" Open :UltiSnipsEdit
nnoremap <leader>ee :UltiSnipsEdit<CR>

nnoremap gf <c-w>v :let mycurf=expand("<cfile>")<cr> :execute("e ".mycurf)<cr><c-w>p
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
"}}}

"{{{ Plug
" Use the following command to install and update plugin's
" :PlugInstall
" :PlugUpdate
" Delete a plugin then run
" :PlugClean
silent! if plug#begin('~/.config/nvim/plugged')
    Plug 'ervandew/supertab'
    Plug 'junegunn/vim-easy-align'                      " Align
    Plug 'lervag/vimtex'                                " For latex
    Plug 'mbbill/undotree'			" Undotree
    Plug 'nathanaelkane/vim-indent-guides'              " Indent
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
    Plug 'mattn/emmet-vim'                              " Html
    " The followings are github related
    Plug 'tpope/vim-fugitive'                           "
    Plug 'junegunn/gv.vim'                              " This goes with vim-fugitive, :GV to open git commit browser
    Plug 'itchyny/vim-gitbranch'                        "
    " The followings are color related
    Plug 'itchyny/lightline.vim'                        " The colored tool bars
    Plug 'frazrepo/vim-rainbow'                         " Color related
    Plug 'sjl/badwolf'                                  " Colorscheme
    Plug 'chrisbra/Colorizer'                           "
    Plug 'altercation/vim-colors-solarized'             " Colorscheme
    Plug 'junegunn/seoul256.vim'
    Plug 'gkapfham/vim-vitamin-onec'
    Plug 'rakr/vim-one'
    Plug 'patstockwell/vim-monokai-tasty' 		" Colorscheme
    Plug 'morhetz/gruvbox'                              "
    Plug 'mileszs/ack.vim'                              "
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'cocopon/iceberg.vim'
    Plug 'kamykn/spelunker.vim'                         " This is for spell check
    Plug 'kamykn/popup-menu.nvim'			    " Pop down menu for spell check
    Plug 'vimwiki/vimwiki'
    Plug 'mzlogin/vim-markdown-toc'
    Plug 'mattn/calendar-vim'                           "
    Plug 'kumavale/vim-weather'                         "
    Plug 'prabirshrestha/async.vim'                     "
    Plug 'neomake/neomake'                              "
    Plug 'neoclide/coc.nvim', {'release': 'release'}
    Plug 'mhinz/vim-startify'                           "
    Plug 'tpope/vim-eunuch'                             "
    Plug 'dense-analysis/ale'                           "
    Plug 'jiangmiao/auto-pairs'                         "
    Plug 'justinmk/vim-sneak'                           "
    Plug 'mkitt/tabline.vim'                            "
    Plug 'itspriddle/vim-shellcheck'                    "
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "
    Plug 'junegunn/fzf.vim'                             "
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
    Plug 'junegunn/goyo.vim'                             "
    Plug 'junegunn/limelight.vim'
    Plug 'justinmk/vim-dirvish'                         "
    Plug 'machakann/vim-highlightedyank'
    Plug 'jremmen/vim-ripgrep'
    Plug 'bogado/file-line'				   " open file with line number
    Plug 'wlemuel/vim-tldr'
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
      " For ncm2 + nvim-yarp"{{{
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
      "}}}
    Plug 'andymass/vim-matchup'
    Plug 'jpalardy/vim-slime'
    Plug  'neomutt/neomutt.vim' 			" for Syntex hightlighting
    Plug 'felipec/notmuch-vim' " NotMuch
    Plug 'jceb/vim-orgmode'		" This is for Emacs OrgMod
    Plug 'vim-scripts/utl.vim'
    Plug 'chrisbra/NrrwRgn'		" This is for narrow region feature from Emacs
    Plug 'AndrewRadev/splitjoin.vim'	" split joint
    Plug 'voldikss/vim-floaterm'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'milkypostman/vim-togglelist'
    Plug 'preservim/tagbar'
    Plug 'xolox/vim-easytags'
    Plug 'dyng/ctrlsf.vim'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'LumaKernel/fern-mapping-fzf.vim'
    Plug 'antoinemadec/FixCursorHold.nvim'
    let g:cursorhold_updatetime = 100
    Plug 'ryanoasis/vim-devicons' 		" For file icons
    Plug 'dcbaker/vim-abook'
    Plug 'szw/vim-dict'
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'reedes/vim-wordy'
    Plug 'reedes/vim-pencil'
    Plug 'reedes/vim-lexical'
    Plug 'prettier/vim-prettier', {'do': 'yarn install','for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}
    Plug 'sjl/gundo.vim'
    Plug 'wellle/targets.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    Plug 'tpope/vim-abolish'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'dbeniamine/cheat.sh-vim'
    Plug 'tommcdo/vim-exchange'
    Plug 'mechatroner/rainbow_csv'
    Plug 'romainl/vim-cool'
    Plug 'jupyter-vim/jupyter-vim', { 'commit': 'a1faca2' }
    Plug 'tpope/vim-speeddating'
    Plug 'petRUShka/vim-sage'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-lua/completion-nvim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'kevinhwang91/nvim-hlslens'
    Plug 'mhartington/formatter.nvim'
    Plug 'nvim-telescope/telescope-frecency.nvim'
    Plug 'AckslD/nvim-neoclip.lua'
    Plug 'cljoly/telescope-repo.nvim'
    Plug 'jvgrootveld/telescope-zoxide'
    Plug 'fannheyward/telescope-coc.nvim'
    Plug 'pwntester/octo.nvim'
    Plug 'ms-jpq/coq_nvim'
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
    Plug 'kdheepak/lazygit.nvim'
    Plug 'sindrets/diffview.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'TimUntersberger/neogit'
    Plug 'numToStr/Comment.nvim'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch' : '0.5-compat'}
    Plug 'nvim-treesitter/playground'
    Plug 'mizlan/iswap.nvim'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'blackCauldron7/surround.nvim'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'hwayne/vim-pivot' " Swap text objects, this is an old one vim plugin
    Plug 'tommcdo/vim-exchange'
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'Iron-E/nvim-highlite'
    Plug 'nvim-telescope/telescope-github.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'dhruvmanila/telescope-bookmarks.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'
    " {{{ Some removed.
    " Plug 'thalesmello/webcomplete.vim'
    " " Set up the browser, default is google Chrome, I am setting it to qutebrowser{{{
    "   let g:coc_webcomplete_script  = '/home/lechen/.vim/plugged/webcomplete.vim/sh/qutebrowser/webcomplete'
    "   let g:ncm2_webcomplete_script = '/home/lechen/.vim/plugged/webcomplete.vim/sh/qutebrowser/webcomplete'
    " "}}}
    " Plug 'bling/vim-bufferline'
    " Plug 'axvr/org.vim'
    " Plug 'dhruvasagar/vim-dotoo'
    " Plug 'tools-life/taskwiki'
    " Plug 'blindFS/vim-taskwarrior'
    " " Use <Tab> and <S-Tab> to navigate through popup menu
    "   inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    "   inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    "
    "   " Set completeopt to have a better completion experience
    "   set completeopt=menuone,noinsert,noselect
    "
    "   " Avoid showing message extra message when using completion
    "   set shortmess+=c
    " "}}}
    call plug#end()
endif
packloadall
silent! helptags ALL
"}}}
"{{{ Plugin
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim"
set rtp+=~/.config/nvim/bundle/Vundle.vim"
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'dracula/vim', { 'name': 'dracula' } 	    " Colorscheme
    Plugin 'xolox/vim-session'
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-lua-ftplugin'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'benmills/vimux'
    Plugin 'honza/vim-snippets'
    Plugin 'SirVer/ultisnips'
    Plugin 'jdhao/nvim-config'
    Plugin 'ludovicchabant/vim-gutentags'
    Plugin 'dhruvasagar/vim-table-mode'
    Plugin 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for VimPlug
    Plugin 'easymotion/vim-easymotion'
    Plugin 'ntpeters/vim-better-whitespace'
    Plugin 'wesQ3/vim-windowswap'
    Plugin 'othree/yajs.vim'
    Plugin 'pangloss/vim-javascript'
    Plugin 'grvcoelho/vim-javascript-snippets'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}}

"{{{ This is for filetype related commands
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=vimwiki
autocmd BufRead ~/Dropbox/workspace/svn/Job-applications/homepage/Emory/index.html nnoremap <leader><leader>  :w! <cr>  :!~/Dropbox/workspace/svn/Job-applications/homepage/Emory/upload-Emory.sh <cr>
autocmd FileType lua nmap <Space> :SlimeSendCurrentLine<CR>j
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END
"}}}
"{{{ hightligh setting for vimdiff
" The folllowing codes are from
" https://github.com/joeytwiddle/vim-diff-traffic-lights-colors/blob/master/plugin/traffic_lights_diff.vim
" When using vimdiff or diff mode
highlight DiffAdd    term=bold         ctermbg=darkgreen ctermfg=white    cterm=bold guibg=DarkGreen  guifg=White    gui=bold
highlight DiffText   term=reverse,bold ctermbg=red       ctermfg=yellow   cterm=bold guibg=DarkRed    guifg=yellow   gui=bold
highlight DiffChange term=bold         ctermbg=black     ctermfg=white    cterm=bold guibg=Black      guifg=White    gui=bold
highlight DiffDelete term=none         ctermbg=darkblue  ctermfg=darkblue cterm=none guibg=DarkBlue   guifg=DarkBlue gui=none
if &background == "light"
	" Changes when bg=white fg=black
	highlight DiffAdd                   ctermfg=black cterm=bold guibg=green      guifg=black
	highlight DiffText   ctermbg=yellow ctermfg=red   cterm=bold guibg=yellow     guifg=red
	highlight DiffChange ctermbg=none   ctermfg=none  cterm=bold guibg=white      guifg=black
	highlight DiffDelete                                         guibg=lightblue  guifg=lightblue
endif

" When viewing a diff or patch file
highlight diffRemoved term=bold ctermbg=black   ctermfg=red    cterm=bold guibg=DarkRed     guifg=white gui=none
highlight diffAdded   term=bold ctermbg=black   ctermfg=green  cterm=bold guibg=DarkGreen   guifg=white gui=none
highlight diffChanged term=bold ctermbg=black   ctermfg=yellow cterm=bold guibg=DarkYellow  guifg=white gui=none
highlight diffLine    term=bold ctermbg=yellow  ctermfg=white  cterm=bold guibg=Yellow      guifg=white gui=none
highlight diffFile    term=bold ctermbg=yellow  ctermfg=black  cterm=none guibg=DarkYellow  guifg=white gui=none
if &background == "light"
	" Changes when bg=white fg=black
	highlight diffRemoved cterm=none guibg=Red     guifg=black
	highlight diffAdded   cterm=none guibg=Green   guifg=black
	highlight diffChanged cterm=none guibg=Yellow  guifg=black
	highlight diffLine    cterm=none guibg=Magenta guifg=black
	highlight diffFile    cterm=none guibg=Yellow  guifg=black
endif

if &diff
    " colorscheme dracula
    colorscheme seoul256
    set cursorline
    map ] ]c
    map [ [c
    set diffopt+=iwhite
    " hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
    " hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
    " hi DiffAdd    ctermfg=233 ctermbg=LightGreen
    " hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    " hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
	highlight   Cursor         ctermfg=White   ctermbg=Yellow   cterm=bold   guifg=white   guibg=white    gui=bold
	highlight   CursorColumn   ctermfg=White   ctermbg=Yellow   cterm=bold   guifg=white   guibg=yellow   gui=bold
endif
"}}}
"{{{ The following is to open link from vim
" https://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!qutebrowser '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
noremap gx :call HandleURL()<cr>"
" }}}
"{{{ For proselint in vim, -- not working
" https://github.com/madzak/vim-proselint/blob/master/syntastic/syntax_checkers/text/proselint.vim
"============================================================================
"File:        proselint.vim
"Description: Syntax checking plugin for syntastic.vim
"Author:      The Proselint team
"
"============================================================================

" if exists('g:loaded_syntastic_text_proselint_checker')
"     finish
" endif
" let g:loaded_syntastic_text_proselint_checker = 1
"
" let s:save_cpo = &cpo
" set cpo&vim
"
" function! SyntaxCheckers_text_proselint_GetLocList() dict
"     let makeprg = self.makeprgBuild({'exe': 'proselint'})
"
"     let errorformat = '%f:%l:%c:%m'
"
"     return SyntasticMake({
"         \ 'makeprg': makeprg,
"         \ 'errorformat': errorformat,
"         \ 'defaults': { 'type': 'Style' },
"         \ 'returns': [0, 1]})
" endfunction
"
" call g:SyntasticRegistry.CreateAndRegisterChecker({
"     \ 'filetype': 'text',
"     \ 'name': 'proselint'})
"
" let &cpo = s:save_cpo
" unlet s:save_cpo
"}}}
"{{{ source various setup files.
" Run the following command to list all vim config files
" :r !ls my_vim
source ~/.config/nvim/my_vim/abbreviations.vim
source ~/.config/nvim/my_vim/coc-snippets_source.vim
source ~/.config/nvim/my_vim/coc_source.vim
source ~/.config/nvim/my_vim/grep-operator.vim
source ~/.config/nvim/my_vim/LatexProject.vim
" source ~/.config/nvim/my_vim/my_dotoo.vim
source ~/.config/nvim/my_vim/my_ctrlsf.vim
source ~/.config/nvim/my_vim/my_vim-wordy.vim
source ~/.config/nvim/my_vim/my_tabline.vim
source ~/.config/nvim/my_vim/my_ale.vim
source ~/.config/nvim/my_vim/my_vim-abook.vim
source ~/.config/nvim/my_vim/my_goyo.vim
source ~/.config/nvim/my_vim/my_vim-lexical.vim
source ~/.config/nvim/my_vim/my_vim-prettier.vim
source ~/.config/nvim/my_vim/my_vim-maximizer.vim
source ~/.config/nvim/my_vim/my_vim-togglelist.vim
source ~/.config/nvim/my_vim/my_vim-floaterm.vim
source ~/.config/nvim/my_vim/my_vim-slime.vim
source ~/.config/nvim/my_vim/my_vim-highlightedyank.vim
source ~/.config/nvim/my_vim/my_vim-dict.vim
source ~/.config/nvim/my_vim/my_Nvim-R.vim
source ~/.config/nvim/my_vim/my_vim-weather.vim
source ~/.config/nvim/my_vim/my_seol256.vim
source ~/.config/nvim/my_vim/my_vim-startify.vim
source ~/.config/nvim/my_vim/my_easy-align.vim
source ~/.config/nvim/my_vim/my_undotree.vim
source ~/.config/nvim/my_vim/my_lightline.vim
source ~/.config/nvim/my_vim/my_vim-one.vim
source ~/.config/nvim/my_vim/my_fzf.vim
source ~/.config/nvim/my_vim/my_Jupiter.vim
source ~/.config/nvim/my_vim/my_markdown.vim
source ~/.config/nvim/my_vim/my_neomutt.vim
source ~/.config/nvim/my_vim/my_ultisnips.vim
source ~/.config/nvim/my_vim/my_vim-easymotion.vim
source ~/.config/nvim/my_vim/my_vim-gutentags.vim
source ~/.config/nvim/my_vim/my_vim-javascript.vim
source ~/.config/nvim/my_vim/my_vim-markdown.vim
source ~/.config/nvim/my_vim/my_vim-session.vim
source ~/.config/nvim/my_vim/my_vim-table-mode.vim
source ~/.config/nvim/my_vim/my_vimtex.vim
source ~/.config/nvim/my_vim/my_vim-tmux-navigator.vim
source ~/.config/nvim/my_vim/my_vimux.vim
source ~/.config/nvim/my_vim/my_vimwiki.vim
source ~/.config/nvim/my_vim/my_vim-windowsap.vim
source ~/.config/nvim/my_vim/my_yajs.vim
source ~/.config/nvim/my_vim/my_vim-matchup.vim
source ~/.config/nvim/my_vim/my_fern.vim
" source ~/.config/nvim/my_vim/org.vim
source ~/.config/nvim/my_vim/spelunker_source.vim
" Run the following command to list all lua files
" :r !ls nvim_lua
source ~/.config/nvim/lua/le/telescope/init.lua
source ~/.config/nvim/lua/plug-comment.lua
source ~/.config/nvim/lua/plug-compe.lua
source ~/.config/nvim/lua/plug-diffview.lua
source ~/.config/nvim/lua/plug-gitsigns.lua
source ~/.config/nvim/lua/plug-iswap.lua
source ~/.config/nvim/lua/plug-lsp_installer.lua
source ~/.config/nvim/lua/plug-lspconfig.lua
source ~/.config/nvim/lua/plug-neoclip.lua
source ~/.config/nvim/lua/plug-neogit.lua
source ~/.config/nvim/lua/plug-nvim-treesitter.lua
source ~/.config/nvim/lua/plug-nvim_tree.lua
source ~/.config/nvim/lua/plug-lsp_installer.lua
source ~/.config/nvim/lua/plug-octo.lua
source ~/.config/nvim/lua/plug-surround.lua
source ~/.config/nvim/lua/plug-registers.lua
source ~/.config/nvim/lua/plug-zoxide.lua
source ~/.config/nvim/lua/plug-nvim-hlsens.lua
"}}}
"{{{ some autocmd group for snippets
augroup snippets
  au!
  autocmd FileType snippets set foldmethod=marker
  " cc will add folding before and after the snippet.
  " Make sure there are empty lines before and after.
  autocmd FileType snippets nnoremap cc {jyykp0ciW#{{{<ESC>}I#}}}<ESC>{dd
augroup END
"}}}
"{{{ The following is for sourcing command.vim whenever exists.
" Function to source only if the file command.vim exists
" https://devel.tech/snippets/n/vIIMz8vZ/load-vim-source-files-only-if-they-exist
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
autocmd BufEnter * call SourceIfExists("command.vim")
" }}}
"{{{ Open item from quickfix in vertical split
" https://stackoverflow.com/questions/16743112/open-item-from-quickfix-window-in-vertical-split
autocmd! FileType qf nnoremap <buffer> <Enter><Enter> <C-w><Enter><C-w>L"}}}
"{{{ Choose colorscheme
set background=dark
" colorscheme solarized
" colorscheme gruvbox
" colorscheme badwolf
" colorscheme monokai
" colorscheme sublimemonokai
" colorscheme vitaminonec
colorscheme one
" colorscheme nvcode
" colorscheme highlite
" colorscheme iceberg
" colorscheme seoul256
" Make transparent background in vim
" hi Normal guibg=NONE ctermbg=NONE
syntax enable
" set termguicolors
" set term=screen-256color
" highlight Pmenu ctermbg=bg ctermfg=white guibg=DarkGreen
highlight Pmenu ctermbg=black ctermfg=white guibg=Non
highlight PmenuSel ctermbg=DarkYellow ctermfg=white guibg=Non
highlight CursorLine ctermbg=black
highlight CursorColumn ctermbg=black
highlight CursorColumn ctermbg=black
highlight Visual ctermbg=DarkGreen ctermfg=bg
highlight ColorColumn ctermbg=black
set foldmethod=marker
"}}}
"{{{ Some other key mappings and settings
nnoremap <silent> <leader>gg :LazyGit<CR>
nnoremap <space>p :PencilToggle<cr>
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
nmap <F9> :TagbarToggle<CR>
set encoding=utf8
set guifont=Hermit\ Nerd\ Font\ 11
let g:airline_powerline_fonts=1
"}}}
