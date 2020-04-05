let g:ale_disable_lsp = 1
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'typescript': ['prettier', 'eslint'],
    \ 'vue': ['prettier'],
    \ 'ruby': ['rubocop'],
    \ 'python': ['black'],
    \ }

" Map
nmap <Leader>F <Plug>(ale_fix)
