if executable('fzf')
  source /usr/share/doc/fzf/examples/fzf.vim
  " Rg command with preview window
  command! -bang -nargs=* -complete=dir Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case ' . <q-args>, 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
  " Files command with preview window
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  " hide statusline
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" map
nnoremap <Leader><Leader> :Buffers<CR>
nnoremap <Leader>C :Commands<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <C-f> :Files<Space>
nnoremap <C-g> :Rg<Space>
