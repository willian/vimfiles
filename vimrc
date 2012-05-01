augroup vimrc
  autocmd!
  autocmd GuiEnter * set guifont=Monaco:h14 guioptions-=T columns=203 lines=70
augroup END

" ****************************************************************
" USING PATHOGEM TO ORGANIZE MY VIM PLUGINS
" ****************************************************************
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
endif

" ****************************************************************
" INCLUDES
" ****************************************************************
source ~/.vim/custom/settings.vim
source ~/.vim/custom/useful_mappings.vim

" ****************************************************************
" COLORS AND SYNTAX
" ****************************************************************
" colorscheme sunburst
colorscheme ir_black
filetype plugin indent on
syntax on               " Enable syntax highlighting

" Search Options
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=green

" ****************************************************************
" LANGUAGUE INDENT CONFIGURATION
" ****************************************************************
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
      \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

autocmd BufNewFile,BufRead *.haml             set ft=haml
autocmd BufNewFile,BufRead *.feature,*.story  set ft=cucumber
autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
      \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif

autocmd FileType javascript             setlocal noexpandtab sw=2 sts=2 isk+=$
autocmd FileType html,xhtml,css         setlocal noexpandtab sw=2 sts=2
autocmd FileType eruby,yaml,ruby setlocal et sw=2 sts=2
autocmd FileType cucumber        setlocal et sw=2 sts=2
autocmd FileType gitcommit       setlocal spell
autocmd FileType ruby            setlocal comments=:#\  tw=79
autocmd FileType vim             setlocal et sw=2 sts=2 keywordprg=:help

autocmd Syntax css syn sync minlines=50

autocmd User Rails if &filetype != 'ruby' | setlocal noexpandtab | endif
autocmd User Rails if &filetype == 'yaml' | setlocal sw=2 sts=2 expandtab | endif
autocmd User Rails if &filetype == 'haml' | setlocal sw=2 sts=2 expandtab | endif
autocmd User Rails if &filetype == 'sass' | setlocal sw=2 sts=2 expandtab | endif
autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>
autocmd User Rails Rnavcommand blueprint spec/blueprints -suffix=_blueprint.rb -default=model()
autocmd User Rails Rnavcommand factory spec/factories -suffix=_factory.rb -default=model()
autocmd User Rails Rnavcommand seeds db/ -default=seeds
autocmd User Rails Rnavcommand steps features/step_definitions -suffix=_steps.rb -default=web
autocmd User Rails Rnavcommand uploader app/uploaders -suffix=_uploader.rb -default=model()
autocmd User Rails Rnavcommand admin app/admin -default=model()

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

" ****************************************************************
" SPECIFIC FUNCTIONS
" ****************************************************************
"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum

" Open the Ruby ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RB :call OpenRubyDoc(expand('<cword>'))<CR>


" Open the Rails ApiDock page for the word under cursos, in a new Firefox tab
function! OpenRailsDoc(keyword)
  let url = 'http://apidock.com/rails/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RR :call OpenRailsDoc(expand('<cword>'))<CR>


" Run the current spec file with spec command
function! RunCurrentSpec(spec)
   exec '!rspec '.a:spec
endfunction
map <F7> :call RunCurrentSpec(bufname("%"))<cr>
