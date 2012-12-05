" ****************************************************************
" indent settings
" ****************************************************************
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" ****************************************************************
" LANGUAGUE INDENT CONFIGURATION
" ****************************************************************
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
      \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

autocmd FileType javascript      setlocal et sw=2 sts=2 isk+=$
autocmd FileType html,xhtml,css  setlocal et sw=2 sts=2
autocmd FileType eruby,yaml,ruby setlocal et sw=2 sts=2
autocmd FileType cucumber        setlocal et sw=2 sts=2
autocmd FileType gitcommit       setlocal spell
autocmd FileType ruby            setlocal comments=:#\  tw=79
autocmd FileType vim             setlocal et sw=2 sts=2 keywordprg=:help

