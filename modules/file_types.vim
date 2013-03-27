" ****************************************************************
" FILE TYPE DEFINITION
" ****************************************************************
autocmd BufNewFile,BufRead Gemfile*           set ft=ruby
autocmd BufNewFile,BufRead *.haml             set ft=haml
autocmd BufNewFile,BufRead *.feature,*.story  set ft=cucumber
autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
      \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif

" When loading text files, wrap them and don't split up words.
au BufNewFile,BufRead *.txt setlocal wrap
au BufNewFile,BufRead *.txt setlocal lbr

