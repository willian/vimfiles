" Wrap the word under the cursor in quotes.  If in ruby mode,
" cycle between quoting styles and symbols.
"
" variable -> "variable" -> 'variable' -> :variable
"
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

