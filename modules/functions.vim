" ****************************************************
" Wrap the word under the cursor in quotes.  If in ruby mode,
" cycle between quoting styles and symbols.
"
" variable -> "variable" -> 'variable' -> :variable
"
" ****************************************************
function! QuoteSwitcher()
  let l:type = strpart( expand("<cWORD>"), 0, 1 )
  let l:word = expand("<cword>")

  if l:type == '"'
    " Double quote to single
    execute ":normal viWc'" . l:word . "'"

  elseif l:type == "'"
    if &ft == 'ruby' || &ft == 'rspec'
      " Single quote to symbol
      execute ':normal viWc:' . l:word
    else
      " Single quote to double
      execute ':normal viWc"' . l:word . '"'
    end

  else
    " Whatever to double quote
    execute ':normal viWc"' . l:word . '"'
  endif

  " Move the cursor back into the cl:word
  call cursor( 0, getpos('.')[2] - 1 )
endfunction

nnoremap <leader>qs :call QuoteSwitcher()<cr>

" ****************************************************
" Merge a tab into a split in the previous window
" ****************************************************
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>

" ****************************************************
" Rename current file (thanks Gary Bernhardt)
" ****************************************************
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

