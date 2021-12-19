" Disable netrw.
" The following is from https://github.com/nickjj/dotfiles/blob/0c8abec8c433f7e7394cc2de4a060f3e8e00beb9/.vimrc#L444-L499
  let g:loaded_netrw  = 1
  let g:loaded_netrwPlugin = 1
  let g:loaded_netrwSettings = 1
  let g:loaded_netrwFileHandlers = 1

  augroup my-fern-hijack
    autocmd!
    autocmd BufEnter * ++nested call s:hijack_directory()
  augroup END

  function! s:hijack_directory() abort
    let path = expand('%:p')
    if !isdirectory(path)
      return
    endif
    bwipeout %
    execute printf('Fern %s', fnameescape(path))
  endfunction
  " Custom settings and mappings.
  let g:fern#disable_default_mappings = 1
  let g:fern#default_hidden = 0
  let g:fern#disable_drawer = 1
  noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=
  function! FernInit() abort
    nmap <buffer><expr>
          \ <Plug>(fern-my-open-expand-collapse)
          \ fern#smart#leaf(
          \   "\<Plug>(fern-action-open:select)",
          \   "\<Plug>(fern-action-expand)",
          \   "\<Plug>(fern-action-collapse)",
          \ )
    nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> n <Plug>(fern-action-new-path)
    nmap <buffer> dd <Plug>(fern-action-remove)
    nmap <buffer> m <Plug>(fern-action-move)
    nmap <buffer> c <Plug>(fern-action-copy)
    nmap <buffer> cc <Plug>(fern-action-cd)
    nmap <buffer> r <Plug>(fern-action-rename)
    nmap <buffer> za <Plug>(fern-action-hidden:toggle)
    nmap <buffer> R <Plug>(fern-action-reload)
    nmap <buffer> t <Plug>(fern-action-mark:toggle)
    nmap <buffer> H <Plug>(fern-action-open:split)
    nmap <buffer> V <Plug>(fern-action-open:vsplit)
    nmap <buffer><nowait> h <Plug>(fern-action-leave)
    nmap <buffer><nowait> l <Plug>(fern-action-enter)
    nmap <buffer><nowait> x <Plug>(fern-action-expand)
    nmap <buffer><nowait> s <Plug>(fern-action-collapse)
    nmap <buffer><nowait> q :q<CR>
  endfunction
  augroup FernGroup
    autocmd!
    autocmd FileType fern call FernInit()
  augroup END
  let g:fern#renderer = "nerdfont"


let g:fern#mapping#fzf#disable_default_mappings = 1
function! s:init_fern_mapping_fzf() abort
  nmap <buffer> F <Plug>(fern-action-fzf-files)
  nmap <buffer> D <Plug>(fern-action-fzf-dirs)
  nmap <buffer> A <Plug>(fern-action-fzf-both)
endfunction
augroup my-fern-mapping-fzf
  autocmd! *
  autocmd FileType fern call s:init_fern_mapping_fzf()
augroup END
