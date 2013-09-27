" Useful shortcuts
cab Q q
cab W w
cab WQ wq
cab WQA wqa
cab WQa wqa
cab Wa wa
cab Wq wq
cab Wqa wqa
cab X x
cab wQ wq
cab w[ w
cab w] w

" Saving when I forgot to open file as root
cmap w!! w !sudo tee % >/dev/null

" Comment lines
map <leader># :s/^/# /<CR>:nohls<CR>

" Remove trailing spaces
nmap <leader>rt :%s/\s\+$//<CR><C-L>

" Open and close the tree files
nmap <silent> <leader>p :NERDTreeToggle<CR>

" Mapping <tab> to chage tabs on commands mode
nmap <tab> :tabnext<CR>

" Make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Adding lines on normal mode easily
nnoremap <C-k> O<ESC>
nnoremap <C-j> o<ESC>

" Easy home and end
map H ^
map L $

" Make Y consistent with C and D
nnoremap Y y$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype changings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>fc :set filetype=css<CR>
nmap <leader>fe :set filetype=eruby<CR>
nmap <leader>fh :set filetype=html<CR>
nmap <leader>fj :set filetype=javascript<CR>
nmap <leader>fm :set filetype=markdown<CR>
nmap <leader>fp :set filetype=python<CR>
nmap <leader>fr :set filetype=ruby<CR>
nmap <leader>fs :set filetype=sass<CR>
nmap <leader>fv :set filetype=vim<CR>
nmap <leader>fy :set filetype=yaml<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps for plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Spec on a vertical Split using RailsVim
nnoremap <F4> :AV<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other shortcuts using F1-F12 keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enabling spelling to Brazilian Portuguese
nmap <F8> :setlocal spell spelllang=pt<CR>
nmap <F9> :setlocal spell spelllang=en<CR>

" Window Navigation
" Use ctrl+(h|j|k|j) to move through open windows.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Ack with <leader>f
map <Leader>f :Ack!<Space>
