"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vi compatable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/VundleVim/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:filetype off

set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" vim
Plugin 'mkitt/tabline.vim'
" color scheme
Plugin 'w0ng/vim-hybrid'
" rails
Plugin 'tpope/vim-rails'
" coffee script
Plugin 'kchmck/vim-coffee-script'
" slim template
Plugin 'slim-template/vim-slim'
" vimproc
Plugin 'Shougo/vimproc.vim'
" typescript
Plugin 'Quramy/tsuquyomi'
" typescript syntax
Plugin 'leafgarland/typescript-vim'

call vundle#end()
:filetype plugin indent on
