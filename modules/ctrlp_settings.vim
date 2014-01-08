" let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|png|gif|jpg|jpeg|svg|eot|ttf|woff)$|(^|[/\\])\.(hg|git|bzr|bundle)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" Set wildcard ignore for ctrlp and ack/ag
set wildignore+=*/tmp/*,vendor/bundle/*/*.bundle,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif,.gitkeep
