""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING JAVASCRIPT FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunJavaScript(filename)
  " Write the file and run the javascript file
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  exec ":!node " . a:filename
endfunction

function! SetJavaScriptFile()
  " Set the js file.
  let t:grb_javascript_file=@%
endfunction

function! RunJavaScriptFile(...)
  call SetJavaScriptFile()
  if !exists("t:grb_javascript_file")
    return
  end
  call RunJavaScript(t:grb_javascript_file)
endfunction

map <leader>js :call RunJavaScriptFile()<cr>
