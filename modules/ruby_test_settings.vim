"""""""""""""""""""""""""""""""
" vim-rspec configurations
"""""""""""""""""""""""""""""""
let g:rspec_command = 'w | Dispatch rspec {spec}'
map <leader>s :call RunCurrentSpecFile()<cr>
map <leader>S :call RunNearestSpec()<cr>
map <leader>l :call RunLastSpec()<cr>
map <leader>a :call RunAllSpecs()<cr>

""""""""""""""""""""
" MINITEST
""""""""""""""""""""
"
""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""
function! MINITEST_RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo

  if !empty(a:filename)
    let l:filetotest = "TEST=" . a:filename
  else
    let l:filetotest = ""
  end

  if filereadable("script/test")
    exec ":Dispatch script/test " . a:filename
  elseif filereadable("Gemfile")
    exec ":Dispatch bundle exec rake test:all ". l:filetotest
  else
    exec ":Dispatch rake test:all ". l:filetotest
  end
endfunction

function! MINITEST_SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! MINITEST_RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_test.rb\|_spec.rb\)$') != -1
  if in_test_file
    call MINITEST_SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call MINITEST_RunTests(t:grb_test_file . command_suffix)
endfunction

function! MINITEST_RunTestFileNoRails()
  let in_test_file = match(expand("%"), '\(.feature\|_test.rb\|_spec.rb\)$') != -1
  if in_test_file
    call MINITEST_SetTestFile()
    :w
    exec ":Dispatch ruby " . t:grb_test_file
  end
endfunction

map <leader>t :call MINITEST_RunTestFile()<cr>
map <leader>nrt :call MINITEST_RunTestFileNoRails()<cr>
map <leader>T :call MINITEST_RunTests('')<cr>

" All functions bellow from https://github.com/vim-scripts/Specky
"
" When in ruby code or an rspec BDD file, try and search recursively through
" the filesystem (within the current working directory) to find the
" respectively matching file.  (code to spec, spec to code.)
"
" This operates under the assumption that you've used chdir() to put vim into
" the top level directory of your project.

function! TestSpecSwitcher()
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
  let l:is_test_file = match( l:filename, '_test.rb$' ) == -1 ? 0 : 1

  if l:is_spec_file
    let l:other_file = substitute( l:filename, '_spec\.rb$', '\.rb', '' )
  elseif l:is_test_file
    let l:other_file = substitute( l:filename, '_test\.rb$', '\.rb', '' )
  else
    let l:other_spec_file = substitute( l:filename, '\.rb$', '_spec\.rb', '' )
    let l:other_test_file = substitute( l:filename, '\.rb$', '_test\.rb', '' )

    if filereadable(l:other_spec_file)
      let l:other_file = l:other_spec_file
    else
      let l:other_file = l:other_test_file
    endif
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

nnoremap <leader>. :call TestSpecSwitcher()<cr>
