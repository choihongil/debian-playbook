"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax and filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
filetype plugin indent on
set termguicolors
if exists("$TMUX")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp,latin1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cindent
set shiftwidth=2
set softtabstop=2
set expandtab
set pastetoggle=<F10>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

nnoremap <Leader>p :cprevious<CR>
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>q :cclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window split
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set nowrap
set iminsert=0
set imsearch=0
set showcmd
set noswapfile
set nobackup
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  " color scheme
  call minpac#add('joshdick/onedark.vim', { 'type': 'opt' })
  call minpac#add('mhartington/oceanic-next', { 'type': 'opt' })
  " fzf
  call minpac#add('junegunn/fzf.vim')
  " language server protocol
  "call minpac#add('autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'silent! !./install.sh' })
  " emoji
  call minpac#add('junegunn/vim-emoji')
  " rails
  call minpac#add('tpope/vim-rails')
  " slim
  call minpac#add('slim-template/vim-slim')
  " javascript
  "call minpac#add('pangloss/vim-javascript')
  call minpac#add('othree/yajs.vim')
  call minpac#add('othree/es.next.syntax.vim')
  call minpac#add('maxmellon/vim-jsx-pretty')
  " file explorer
  call minpac#add('scrooloose/nerdtree')
  " icon
  call minpac#add('ryanoasis/vim-devicons')
  " indent
  call minpac#add('Yggdroot/indentLine')
  " lint
  call minpac#add('w0rp/ale')
  " job
  call minpac#add('skywind3000/asyncrun.vim')
  " markdown
  call minpac#add('shime/vim-livedown', { 'do': 'silent! !yarn global add livedown' })
endif

" Plugin settings here.
" colorscheme
silent! packadd! oceanic-next
silent! colorscheme oceanic-next

" powerline
if strlen($POWERLINE_ROOT) > 0
  set laststatus=2
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup
endif

" fzf
if executable('fzf')
  set runtimepath+=~/.fzf
  " Rg
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
  " Files
  command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  " Colors
  command! -bang Colors
    \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
endif

" asyncrun
" https://github.com/skywind3000/asyncrun.vim/wiki/Quickfix-Best-Practice
autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
noremap <F9> call asyncrun#quickfix_toggle(8)<cr>

" language server protocol
"if executable('language_server-ruby')
"endif
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', { 'do': 'quit' })
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
