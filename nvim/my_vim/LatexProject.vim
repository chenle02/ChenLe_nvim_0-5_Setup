set textwidth=100
set backspace=0
set lazyredraw
set ttyfast

" Set status line display
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Define my command for pdflatex
command! Pdflatax :update|lcd %:p:h|!pdflatex -synctex=1 %
command! Lualatax :update| !lualatex --shell-escape -synctex=1 %
autocmd FileType tex noremap <leader>c :Pdflatax <CR>
" autocmd FileType tex noremap <leader><leader> :Lualatax <CR>
" autocmd FileType tex noremap <leader><leader> :update<bar>:call VimuxRunCommandInDir('lualatex --shell-escape -synctex=1 ',1)<CR>
autocmd FileType tex noremap <leader><leader> :update<bar>:AsyncRun! lualatex --shell-escape -synctex=1 %<CR>
autocmd FileType tex set foldmethod=marker
autocmd FileType tex set bs=0
autocmd FileType tex.lua noremap <leader><leader> :Lualatax <CR>

au FileType tex let b:AutoPairs = {"'":"'",'"':'"', '':''}

if &filetype == "tex"
  let g:AutoPairs = {"'":"'",'"':'"', '':''}
endif

nnoremap <leader>w :set wrap!<cr>

" Some useful macros
" 1. @m minipage, first write a fraction for the \textwidth, then @m{{{
let @m="\<Esc>BdWi\\begin{minipage}{\<Esc>pa\\textwidth}\<Esc>0yf}o\<Esc>pFbdwiend\<Esc>ko"
"}}}
" 2. @g inclurdegraphics, first write the file name.{{{
let @g="\<Esc>BdWi\\includegraphics[scale=0.25]{\<Esc>pa}\<Esc>Bwwwww\<Esc>"
"}}}
" 3. @o The following will make beamer slides only. Make sure select the text first{{{
let @o="di\\only<1->{}hp"
"}}}
" 4. @a The following is to add alert to the selected text{{{
let @a='di\alert{pa}'
"}}}
" 5. Add textcolor to the selected text, the color is in{{{
" register n.
" @c to add color from register z: magenta
" @v to add another color from register b: cyan
" @i to add \it in side {}. Start inside {}.
" @x to remove color, start when the cursor is on textcolor
" @r to remove the next textcolor
let @z='magenta'
let @c='di\textcolor{"zpa}{pa}'
let @b='cyan'
let @v='di\textcolor{"bpa}{pa}'
let @x='diwhxda{sd{'
let @i='di{\it pa}'
let @r="/textcolor\<cr>hdf}sd{"
" The following is to add color for the selected text within a line
vnoremap <C-n> "hdi\textcolor{magenta}{<esc>"hpa}<esc>
" The following is to add color for the selected text by lines
vnoremap <C-m> "hdO\textcolor{magenta}{<cr>}<esc>k"hp<esc>
"}}}
" 6. The following transform \| ... \| to \Norm{...} in the current line.{{{
" test here: \|a asdf.. adf\|
" Either of the following two will give the same result.
nnoremap <c-n><c-n> :s/\\\|\(.*\)\\\|/\\Norm{\1}/g<c-b>
"}}}
" 7. gF: The following is to open latex file without extension.{{{
" Created one if it does not exist.
noremap gF :vsplit <cfile>.tex<cr>
"}}}
" 8. bb: The following command align equations.{{{
" This requires easyalign plugin.
nmap bb viega*&
" nnoremap bb vie:EasyAlign *&<cr>
"}}}
" 9. visual <c-r>: replace/substitute the visual selected part.{{{
" register h will be used for this purpose.
vnoremap <C-r> "hy:bufdo %s/<C-r>h//gc<left><left><left>
vnoremap <C-r><C-r> "hy:%s/<C-r>h//gc<left><left><left>
"}}}
" 10. The following command is to pdf file all indent from ../refs/ folder.{{{
nnoremap gtt :/\%<c-r>=line('.')<cr>lcite{<CR>n5lyt}:!zathura ./refs/<C-r>".pdf &
vnoremap gtt "hy:!zathura ./refs/<C-r>h.pdf &
"}}}
" 10. Switch $$...$$ to \begin{align} ... \end{align}
" let @e = "\<ESC>?$$\<CR>ddO\\begin{align}\<ESC>/$$\<CR>ddO\\end{align}\<ESC>"
let @e="di\$o\\begin{align*}\<CR>\<Esc>po\\end{align*}\<Esc>?\$\$\<CR>dd"
" let @e="dd"
" Switch \[...\] to \begin{align} ... \end{align}
" nnoremap <leader>e :normal! mm?$$<cr>ddO\begin{align}<esc>/$$<cr>ddO\end{align}<esc>'m
nnoremap <leader>e :normal! mm/\$\$<cr>Nxxi\begin{align*}<cr><esc>nxxo\end{align*}<esc>'m
nnoremap <leader>r :normal! vi{"9ydi{diW"9pa<space><esc><cr>
" 11. The following is to use dmenu to open things.
" https://leafo.net/posts/using_dmenu_to_open_quickly.html
" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction
" Find a file and pass it to cmd
function! DmenuOpen(cmd,files)
  " let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  let fname = Chomp(system("ls ". a:files . " | dmenu -i -l 30 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname ." &"
endfunction
" Open files with dmenu.
nnoremap <leader>rr :call DmenuOpen("!zathura","refs/*.pdf")<cr>
nnoremap <leader>rm :call DmenuOpen("!mathematica","codes/*.nb")<cr>
nnoremap <leader>rd :call DmenuOpen("!zathura","Discussions/*.pdf *.pdf")<cr>
" 12. The following is for Zathura forward search
" Double hit ff in normal mode for forward locate to the position in pdf file viewed in zathura
function! SyncTexForward()
  let linenumber=line(".")
  let colnumber=col(".")
  let filename=bufname("%")
  let filenamePDF=filename[:-4]."pdf"
  let execstr="!zathura --synctex-forward " . linenumber . ":" . colnumber . ":" . filename . " " . filenamePDF . "&>/dev/null &"
  exec execstr
endfunction
noremap ff :call SyncTexForward()<CR>
" The following is the setup when in the vimdiff mode.
if &diff
	autocmd FileType tex nnoremap <silent> <space><space> :windo call SyncTexForward()<CR> <c-w>w
	noremap <leader><space> :silent windo !zathura %:r.pdf &<cr>
else
	autocmd FileType tex nnoremap <silent> <space>b :call SyncTexForward()<CR>
	noremap <leader><space> :silent !zathura %:r.pdf &<cr>
endif
" 13. Generate matrix and arrays
" run the following command in command mode:
" https://vi.stackexchange.com/questions/17439/easiest-way-to-insert-latex-matrix
" :Matrix 3 4
" :Array 3 4
" The first argument has to be the number for rows.
" If the second argument is not given, the default column will be 3.
function! CreateMatrix(rows, ...) abort
  let cols = a:0 ? a:1 : 3
  let matrix = ['\begin{bmatrix}']
  call extend(matrix, repeat([repeat('0 & ', cols - 1) . '0\\'], a:rows))
  call add(matrix, '\end{bmatrix}')
  call append(line('.') - 1, matrix)
endfunction
command! -nargs=+ Matrix silent call CreateMatrix(<f-args>)
" Now for Array
function! CreateArray(rows, ...) abort
  let cols = a:0 ? a:1 : 3
  let matrix = ['\begin{array}{' . repeat('c',cols) . '}']
  call extend(matrix, repeat([repeat('<++> & ', cols - 1) . '<++>\\'], a:rows))
  call add(matrix, '\end{array}')
  call append(line('.') - 1, matrix)
endfunction
command! -nargs=+ Array silent call CreateArray(<f-args>)

"{{{ My setup for reviewing reports
command! GenReview :w!| !GenReview.lua > /home/lechen/Dropbox/vimwiki/Reviewing\ records.wiki
command! GenMathReview :w!| !GenMathReview.lua > /home/lechen/Dropbox/vimwiki/MathRew.wiki
augroup MyNoteGroup
	" au! BufRead,BufNewFile,BufEnter *.java,*Test.java,*/test/* <<YOURCOMMANDHERE>>
	au! BufRead,BufNewFile,BufEnter notes.tex nnoremap <leader>r :GenReview<CR>
	autocmd BufRead,BufNewFile,BufEnter notes.tex :set filetype=vimwiki.tex
augroup END
"}}}

call vimtex#imaps#add_map({ 'lhs' : '2',  'rhs' : '\partial', 'wrapper' : 'vimtex#imaps#wrap_trivial'})
call vimtex#imaps#add_map({ 'lhs' : '1',  'rhs' : '\ell', 'wrapper' : 'vimtex#imaps#wrap_trivial'})

