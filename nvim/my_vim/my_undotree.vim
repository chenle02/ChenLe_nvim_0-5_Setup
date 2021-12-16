if has("persistent_undo")
  set undodir=$HOME"/.undodir"
  set undofile
endif
nnoremap <F5> :UndotreeToggle<cr>
