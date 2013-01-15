" ****************************************************************
" GUI (FOR GVIM AND MACVIM)
" ****************************************************************
augroup vimrc
  autocmd!
  autocmd GuiEnter * set guifont=Menlo:h14 guioptions-=T columns=203 lines=70
augroup END

" ****************************************************************
" COLORS AND SYNTAX
" ****************************************************************
colorscheme envylabs
filetype plugin indent on
syntax on

autocmd Syntax css syn sync minlines=50

" ****************************************************
" SETTING STATUSLINE
" ****************************************************
" Fugitive.vim statusline to show current branch
set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=[%{&ft}]%-14.([%l/%L],%c%V%)\ %P

" Syntastic statusline config to show syntax errors on saving
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*

