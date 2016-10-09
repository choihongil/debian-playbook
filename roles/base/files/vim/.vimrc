"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:source ~/.vim/plugin.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_win32')
  :language message en
endif
:set langmenu=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set encoding=utf-8
:set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp,latin1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256
:set background=dark
:syntax on
:colorscheme hybrid

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set cindent
:set shiftwidth=4
:set softtabstop=4
:set expandtab
:set pastetoggle=<F9>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set hlsearch
:set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window split
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set splitbelow
:set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set number
:set nowrap
:set iminsert=0
:set imsearch=0
:set showcmd
:set noswapfile
:set nobackup
:set backspace=indent,eol,start
":set ambiwidth=double

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if strlen($POWERLINE_ROOT) > 0
  :set laststatus=2
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
endif
