""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>l :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunTestFileNoRails()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
    :w
    exec ":!rspec --color " . t:grb_test_file
  end
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

map <leader>s :call RunTestFile()<cr>
map <leader>S :call RunNearestTest()<cr>
map <leader>b :call RunTestFileNoRails()<cr>
map <leader>a :call RunTests('')<cr>

" All functions bellow from https://github.com/vim-scripts/Specky
"
" When in ruby code or an rspec BDD file, try and search recursively through
" the filesystem (within the current working directory) to find the
" respectively matching file.  (code to spec, spec to code.)
"
" This operates under the assumption that you've used chdir() to put vim into
" the top level directory of your project.

function! SpecSwitcher()
  " If we aren't in a ruby or rspec file then we probably don't care
  " too much about this function.
  if &ft != 'ruby' && &ft != 'rspec'
    call s:err( "Not currently in ruby or rspec mode." )
    return
  endif

  " Ensure that we can always search recursively for files to open.
  let l:orig_path = &path
  set path=**

  " Get the current buffer name, and determine if it is a spec file.
  "
  " /tmp/something/whatever/rubycode.rb ---> rubycode.rb
  " A requisite of the specfiles is that they match to the class/code file,
  " this emulates the eigenclass stuff, but doesn't require the same
  " directory structures.
  "
  " rubycode.rb ---> rubycode_spec.rb
  let l:filename     = matchstr( bufname('%'), '[0-9A-Za-z_.-]*$' )
  let l:is_spec_file = match( l:filename, '_spec.rb$' ) == -1 ? 0 : 1

  if l:is_spec_file
    let l:other_file = substitute( l:filename, '_spec\.rb$', '\.rb', '' )
  else
    let l:other_file = substitute( l:filename, '\.rb$', '_spec\.rb', '' )
  endif

  let l:bufnum = bufnr( l:other_file )
  if l:bufnum == -1
    " The file isn't currently open, so let's search for it.
    execute 'find ' . l:other_file
  else
    " We've already got an open buffer with this file, just go to it.
    execute 'buffer' . l:bufnum
  endif

  "execute 'set path=' . l:orig_path
endfunction

nnoremap <leader>. :call SpecSwitcher()<cr>

