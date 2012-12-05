" ****************************************************
" Some configurations with let
" ****************************************************
let mapleader = ","

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
" My set configurations
" ****************************************************
set bs=2                                        " Backspace over everything in insert mode
set cursorline                                  " Setting a line over cursor
set copyindent                                  " Copy previous indent on the current line
set encoding=utf-8                              " Default encoding is utf8
set hidden                                      " Don't close buffers, just hidden them
set laststatus=2                                " Always show status line.
set list                                        " Configuration to use definitions below
set listchars=tab:\ \ ,extends:>,precedes:<     " Special chars to show tabs, eol and bol
set number                                      " Line numbers on
set wildmenu                                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest                       " Make cmdline tab completion similar to bash
set wildignore+=*.o,*~,*.swp,*.pyc,*.pyo,*.gif  " Stuff to ignore when tab completing
set wildignore+=*.dll,*.obj,*.bak,*.jpg,*.png   " Stuff to ignore when tab completing

