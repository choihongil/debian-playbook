syntax enable
"filetype on
filetype plugin indent on
set termguicolors
if exists("$TMUX")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" encoding
set encoding=utf-8
set fileencodings=utf-8,utf-16le,cp932,iso-2022-jp,euc-jp,latin1
set langmenu=none
"scriptencoding utf-8
"
" indent
"set autoindent
set cindent
"set smartindent
set expandtab
set pastetoggle=<F10>
set shiftwidth=2
set softtabstop=2
"set tabstop=2

" map
let mapleader = "\<Space>"
nnoremap <Leader>p :cprevious<CR>
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>q :cclose<CR>

" search
set hlsearch
set incsearch
"set ignorecase
"set smartcase

" window split
set splitbelow
set splitright

" others
"set ambiwidth=double
set backspace=indent,eol,start
"set clipboard+=unnamed
set cmdheight=2
"set hidden
set iminsert=0
set imsearch=0
"set laststatus=2
set nobackup
"set noerrorbells
set noswapfile
"set noundofile
set nowrap
"set nowritebackup
set number
"set shellslash
set signcolumn=yes
"set shortmess+=c
set showcmd
"set title
"set updatetime=300
"set virtualedit=block
"set wildmenu

" Vim-Plug
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" colorscheme
Plug 'mhartington/oceanic-next'
" language packs
Plug 'sheerun/vim-polyglot'
" status line
Plug 'vim-airline/vim-airline'
" indent
Plug 'Yggdroot/indentLine'
" Conquer of Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" fzf
Plug 'junegunn/fzf.vim'
" Asynchronous linting/fixing
Plug 'w0rp/ale'
" tree explorer
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" icon
Plug 'ryanoasis/vim-devicons'
" emoji
Plug 'junegunn/vim-emoji'
" rails
Plug 'tpope/vim-rails'
" Initialize plugin system
call plug#end()

colorscheme OceanicNext

" airline
" make airline show the diagnostic information from coc
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" ale
let g:ale_disable_lsp = 1
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'typescript': ['prettier', 'eslint'],
    \ 'vue': ['prettier'],
    \ 'ruby': ['rubocop'],
    \ }
" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)

" fzf
if executable('fzf')
  "set runtimepath+=~/.fzf
  source /usr/share/doc/fzf/examples/fzf.vim
  " RG
  command! -bang -nargs=* RG
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '
    \   . <q-args>, 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
  " Files
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  " map
  nnoremap <C-g> :RG 
  nnoremap <C-j> :GFiles<CR>
  nnoremap <C-k> :Files<CR>
endif

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> :NERDTreeFind<CR>
