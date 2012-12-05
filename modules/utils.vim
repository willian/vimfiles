" ****************************************************************
" TRAILING SPACE REMOVER
" ****************************************************************
autocmd BufWritePre * :%s/\s\+$//e

" ****************************************************************
" TEMPLATES
" ****************************************************************
" HTML: When a new .html is opened, it will come with a skeleton pre-designed
au BufNewFile *.html read ~/.vim/templates/html/skeleton.html

" ****************************************************************
" USEFUL VIM CONFS
" ****************************************************************
" Store cursor position and command history
set viminfo='10,\"30,:40,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

