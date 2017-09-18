"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vi compatable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/VundleVim/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:filetype off
:set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" color scheme
Plugin 'joshdick/onedark.vim'
" rails
Plugin 'tpope/vim-rails'
" html
Plugin 'slim-template/vim-slim'
" javascript
Plugin 'pangloss/vim-javascript'
" grep
Plugin 'mileszs/ack.vim'
" markdown
Plugin 'shime/vim-livedown'

call vundle#end()
:filetype plugin indent on
