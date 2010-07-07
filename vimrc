runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
endif

syntax on
filetype plugin indent on

augroup vimrc
  autocmd!
  autocmd GuiEnter * set guifont=Monaco:h12 guioptions-=T columns=120 lines=70 number
  autocmd GuiEnter * colorscheme vividchalk
augroup END

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs for some file types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType make       set noexpandtab
autocmd FileType html       set noexpandtab
autocmd FileType htmldjango set noexpandtab
autocmd FileType eruby      set noexpandtab
autocmd FileType xml        set noexpandtab
autocmd FileType javascript set noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Removing ane extra whitespaces from the ends of lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre *.py        normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.pt        normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.rb        normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.js        normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.css       normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.html      normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.html.erb  normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.yml       normal m`:%s/\s\+$//e ``

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: rails-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rails_default_file='config/database.yml'
autocmd User Rails if &filetype != 'ruby' | setlocal noexpandtab | endif
autocmd User Rails if &filetype == 'yaml' | setlocal sw=2 sts=2 expandtab | endif
autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>

