set termguicolors

" encoding
set fileencodings=utf-8,utf-16le,cp932,iso-2022-jp,euc-jp,latin1

" indent
set cindent
set expandtab
set shiftwidth=2
let &softtabstop=&shiftwidth
set pastetoggle=<F10>

" search
set ignorecase
set smartcase

" window split
set splitbelow
set splitright

" options
set cmdheight=2
set hidden
set noswapfile
set nowrap
set number
set signcolumn=yes
set updatetime=300

" map
let mapleader = "\<Space>"

" available keys
" ctrl-m, ctrl-p, ctrl-q, ctrl-s
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
nnoremap j gj
nnoremap k gk
nnoremap <Leader>w :write<CR>
nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <C-w>a :qall<CR>

" tab
"nmap <Leader>te :tabedit %<CR>
nnoremap \t :tabclose<CR>

" terminal
tnoremap <C-]> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" QuickFix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap \q :cclose<CR>

" LocationList
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap \l :lclose<CR>

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

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <Leader>ac <Plug>(coc-codeaction)
" Remap for do codeLens of current line
nmap <Leader>lc <Plug>(coc-codelens-action)
" Fix autofix problem of current line
nmap <Leader>qf <Plug>(coc-fix-current)
" Remap for rename current word
nmap <Leader>rn <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Using CocList
nnoremap <Leader>ca :<C-u>CocList diagnostics<CR>
nnoremap <Leader>ce :<C-u>CocList extensions<CR>
nnoremap <Leader>cc :<C-u>CocList commands<CR>
nnoremap <Leader>co :<C-u>CocList outline<CR>
nnoremap <Leader>cs :<C-u>CocList --interactive symbols<CR>
nnoremap <Leader>cj :<C-u>CocNext<CR>
nnoremap <Leader>ck :<C-u>CocPrev<CR>
nnoremap <Leader>cp :<C-u>CocListResume<CR>

" FZF
nnoremap <Leader><Leader> :Buffers<CR>
nnoremap <Leader>C :Commands<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <C-f> :Files<Space>
nnoremap <C-g> :Rg<Space>
" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> :NERDTreeFind<CR>

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
" snippets
Plug 'honza/vim-snippets'
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
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-highlight',
      \ 'coc-json',
      \ 'coc-python',
      \ 'coc-rls',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-yaml',
      \ ]

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
