" ****************************************************
" Some configurations with let
" ****************************************************
let mapleader = ","

" ****************************************************
" Setting statusline
" ****************************************************
" Fugitive.vim statusline to show current branch
set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=[%{&ft}]%-14.([%l/%L],%c%V%)\ %P

" Syntastic statusline config to show syntax errors on saving
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*

" ****************************************************
" Search configurations
" ****************************************************
set hls                             " HighLightedSearch
set ic                              " IgnoreCase
set is                              " IncrementedSearch
set scs                             " SmartCaSe

" ****************************************************
" My set configurations
" ****************************************************
set ai                                          " AutoIndent
set bs=2                                        " Backspace over everything in insert mode
set cursorline                                  " Setting a line over cursor
set copyindent                                  " Copy previous indent on the current line
set encoding=utf-8                              " Default encoding is utf8
set expandtab                                   " Default encoding is utf8
set hidden                                      " Don't close buffers, just hidden them
set laststatus=2                                " Always show status line.
set list                                        " Configuration to use definitions below
set listchars=tab:\ \ ,extends:>,precedes:<     " Special chars to show tabs, eol and bol
set nu                                          " Line numbers on
set sts=2                                       " Tab size
set sw=2                                        " ShiftWidth: Used on autoindent
set ts=2                                        " TabStop
set wildmenu                                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest                       " Make cmdline tab completion similar to bash
set wildignore+=*.o,*~,*.swp,*.pyc,*.pyo,*.gif  " Stuff to ignore when tab completing
set wildignore+=*.dll,*.obj,*.bak,*.jpg,*.png   " Stuff to ignore when tab completing

" ****************************************************
" Removing some default confs
" ****************************************************
set nocompatible                    " We're running Vim, not Vi!
set noerrorbells                    " No noise.
set nofoldenable                    " I don't want it folding by default
set notitle                         " Removing 'Thanks for flying Vim' :)
set novisualbell                    " No blinking .
set nowrap                          " Line wrapping off

" ****************************************************
" Adding custom commands to rails.vim
" ****************************************************
" autocmd User Rails if &filetype != 'ruby'  | setlocal noexpandtab | endif
" autocmd User Rails if &filetype == 'eruby' | setlocal sw=2 sts=2 expandtab | endif
" autocmd User Rails if &filetype == 'yaml'  | setlocal sw=2 sts=2 expandtab | endif
" autocmd User Rails if &filetype == 'haml'  | setlocal sw=2 sts=2 expandtab | endif
" autocmd User Rails if &filetype == 'sass'  | setlocal sw=2 sts=2 expandtab | endif
autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>
autocmd User Rails Rnavcommand blueprint spec/blueprints -suffix=_blueprint.rb -default=model()
autocmd User Rails Rnavcommand factory spec/factories -suffix=_factory.rb -default=model()
autocmd User Rails Rnavcommand seeds db/ -default=seeds
autocmd User Rails Rnavcommand steps features/step_definitions -suffix=_steps.rb -default=web
autocmd User Rails Rnavcommand uploader app/uploaders -suffix=_uploader.rb -default=model()
autocmd User Rails Rnavcommand admin app/admin -default=model()

" ****************************************************
" Adding custom settings to NERDCommenter
" ****************************************************
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1
let g:VCSCommandDisableMappings = 1

" ****************************************************
" Auto align for cucumber tables
" ****************************************************
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

