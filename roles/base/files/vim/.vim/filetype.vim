" jbuilder
au BufNewFile,BufRead *.jbuilder set ft=ruby

" tmux.conf
augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END
