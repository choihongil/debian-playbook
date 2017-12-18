"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:if exists('*minpac#init')
  " minpac is loaded.
  :call minpac#init()
  :call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  " color scheme
  :call minpac#add('joshdick/onedark.vim', { 'type': 'opt' })
  " fzf
  :call minpac#add('junegunn/fzf.vim')
  " rails
  :call minpac#add('tpope/vim-rails')
  " slim
  :call minpac#add('slim-template/vim-slim')
  " javascript
  :call minpac#add('pangloss/vim-javascript')
  " grep
  :call minpac#add('mileszs/ack.vim')
  " markdown
  :call minpac#add('shime/vim-livedown', { 'do': 'silent! !yarn global add livedown' })
:endif

" Plugin settings here.
" color
:set termguicolors
:if exists("$TMUX")
  :let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  :let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
:endif

:syntax enable
:silent! packadd! onedark.vim
:silent! colorscheme onedark

" powerline
:if strlen($POWERLINE_ROOT) > 0
  :set laststatus=2
  :python3 from powerline.vim import setup as powerline_setup
  :python3 powerline_setup()
  :python3 del powerline_setup
:endif

" fzf
:if executable('fzf')
  :set runtimepath+=~/.fzf
:endif

" ack
:if executable('ag')
  :let g:ackprg = 'ag --vimgrep'
:endif

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
:command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', { 'do': 'quit' })
:command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set langmenu=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set encoding=utf-8
:set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp,latin1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set cindent
:set shiftwidth=2
:set softtabstop=2
:set expandtab
:set pastetoggle=<F10>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set hlsearch
:set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let mapleader = ","

:nnoremap <Leader>p :cprevious<CR>
:nnoremap <Leader>n :cnext<CR>
:nnoremap <Leader>q :cclose<CR>

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
