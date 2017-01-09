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
" color scheme
Plugin 'w0ng/vim-hybrid'
" rails
Plugin 'tpope/vim-rails'
" html
Plugin 'slim-template/vim-slim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
" javascript
Plugin 'isRuslan/vim-es6'
Plugin 'ternjs/tern_for_vim'
" ranger
Plugin 'francoiscabrol/ranger.vim'

call vundle#end()
:filetype plugin indent on
