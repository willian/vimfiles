" Useful shortcuts
cab Q q
cab W w
cab WQ wq
cab WQA wqa
cab WQa wqa
cab Wa wa
cab Wq wq
cab Wqa wqa
cab wQ wq
cab w[ w
cab w] w

" Saving when a forgot to open file as root
cmap w!! w !sudo tee % >/dev/null

" Comment lines
map <leader># :s/^/#/<CR>:nohls<CR>

" Remove trailing spaces
nmap <leader>rt :%s/\s\+$//<CR>

" DOS2nix
nmap <leader>unix :%s/\r$//<CR>

" Pasting on the below line when yanked with visual mode
nmap <leader>p :put<CR>==

" Mapping <tab> to chage tabs on commands mode
nmap <tab> :tabnext<CR>

" Increment and decrement numbers using UP and DOWN arrows
nmap <up> <C-a>
nmap <down> <C-x>

" Make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Adding lines on normal mode easily
nnoremap <C-k> O<ESC>
nnoremap <C-j> o<ESC>

" Some things on the middle of the screen
nmap # #zz
nmap * *zz
nmap N Nzz
nmap g# g#zz
nmap g* g*zz
nmap n nzz

" Easy home and end
map H ^
map L $

"make Y consistent with C and D
nnoremap Y y$


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype changings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>fc :set filetype=css<CR>
nmap <leader>fj :set filetype=javascript<CR>
nmap <leader>fm :set filetype=markdown<CR>
nmap <leader>fp :set filetype=python<CR>
nmap <leader>fr :set filetype=ruby<CR>
nmap <leader>fs :set filetype=sass<CR>
nmap <leader>fy :set filetype=yaml<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps for plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open Spec on a vertical Split using RailsVim
nnoremap <F4> :AV<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other shortcuts using F1-F12 keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enabling spelling to Brazillian Portuguese
nmap <F8> :setlocal spell spelllang=pt<CR>
nmap <F9> :setlocal spell spelllang=en<CR>

" Tabular
if exists(":Tabularize")
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
endif
