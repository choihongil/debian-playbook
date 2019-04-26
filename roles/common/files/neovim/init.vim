" vim-plug automatically executes `filetype plugin indent on` and `syntax enable`
filetype plugin indent on
syntax enable
set termguicolors
"if exists("$TMUX")
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif

" encoding
set encoding=utf-8
set fileencodings=utf-8,utf-16le,cp932,iso-2022-jp,euc-jp,latin1
set langmenu=none

" indent
set cindent
set expandtab
set shiftwidth=2
let &softtabstop=&shiftwidth
set pastetoggle=<F10>

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" window split
set splitbelow
set splitright

" others
"set ambiwidth=double
set backspace=indent,eol,start
"set clipboard+=unnamed
set cmdheight=2
set hidden
set iminsert=0
set imsearch=0
set nobackup
set noswapfile
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

" map
let mapleader = "\<Space>"

" available keys
" ctrl-m, ctrl-h, ctrl-n ctrl-p ctrl-q, ctrl-s
" ca cd cm co cp cq cr cu cv cx cy cz
" cA cD    cO cP cQ cR cU cV cX cY cZ
" da dc dm dq dr du dv dx dy dz
" dA dC    dQ
" va vc vd vm vo vp vq vr vs vu vv vx vy vz
" vA
" ya yc yd ym yo yp yq yr ys yu yv yx yz
" yA
" gb gc gl
" gB
" zp zq zu zy

" Common
nmap j gj
nmap k gk
nmap <Leader>w :write<CR>
nmap <Leader>/ :nohlsearch<CR>
nmap <Leader>d :bdelete<CR>

" tab
"nmap <Leader>te :tabedit %<CR>
nmap \t :tabclose<CR>

" terminal
:tnoremap <C-]> <C-\><C-n>
:tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" QuickFix
nmap [q :cprevious<CR>
nmap ]q :cnext<CR>
nmap \q :cclose<CR>

" LocationList
nmap [l :lprevious<CR>
nmap ]l :lnext<CR>
nmap \l :lclose<CR>

" Edit config files
nmap <Leader>ev :edit $VIMCONFIG/init.vim<CR>
nmap <Leader>ef :edit ~/.config/fish/config.fish<CR>
nmap <Leader>es :edit ~/.config/sway/config<CR>
nmap <F5> :source $VIMCONFIG/init.vim<CR>
nmap <Leader>n :enew<CR>

" ALE
nmap <Leader>F <Plug>(ale_fix)

" Coc
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <CR> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" FZF
nmap <Leader><Leader> :Buffers<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>g :GFiles<CR>
nmap <C-f> :Files<Space>
nmap <C-g> :Rg<Space>
" NERDTree
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>l :NERDTreeFind<CR>

" Vim-Plug
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" colorscheme
Plug 'mhartington/oceanic-next'
" language packs
Plug 'sheerun/vim-polyglot'
" lightline
Plug 'itchyny/lightline.vim'
" indent
Plug 'Yggdroot/indentLine'
" motion
Plug 'justinmk/vim-sneak'
" surround
Plug 'tpope/vim-surround'
" autopairs
Plug 'jiangmiao/auto-pairs'
" comment
Plug 'tpope/vim-commentary'
" endwise
"Plug 'tpope/vim-endwise'
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
" Initialize plugin system
call plug#end()

colorscheme OceanicNext

" autopairs
let g:AutoPairsFlyMode = 1

" ale
let g:ale_disable_lsp = 1
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'typescript': ['prettier', 'eslint'],
    \ 'vue': ['prettier'],
    \ 'ruby': ['rubocop'],
    \ }

" fzf
if executable('fzf')
  "set runtimepath+=~/.fzf
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

" coc
"let g:coc_global_extensions = [
"      \ 'coc-css',
"      \ 'coc-json',
"      \ 'coc-python',
"      \ 'coc-rls',
"      \ 'coc-solargraph'
"      \ 'coc-tsserver',
"      \ 'coc-vetur',
"      \ 'coc-yaml',
"      \ ]

" Itegration with lightline
function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" mapping functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
