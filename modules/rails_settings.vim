" ****************************************************
" Adding custom commands to rails.vim
" ****************************************************
" autocmd User Rails if &filetype != 'ruby'  | setlocal noexpandtab | endif
" autocmd User Rails if &filetype == 'eruby' | setlocal sw=2 sts=2 expandtab | endif
" autocmd User Rails if &filetype == 'yaml'  | setlocal sw=2 sts=2 expandtab | endif
" autocmd User Rails if &filetype == 'haml'  | setlocal sw=2 sts=2 expandtab | endif
" autocmd User Rails if &filetype == 'sass'  | setlocal sw=2 sts=2 expandtab | endif
autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>
autocmd User Rails Rnavcommand admin app/admin -default=model()
autocmd User Rails Rnavcommand blueprint spec/blueprints -suffix=_blueprint.rb -default=model()
autocmd User Rails Rnavcommand factory spec/factories -default=model()
autocmd User Rails Rnavcommand presenter app/presenters -suffix=_presenter.rb -default=model()
autocmd User Rails Rnavcommand seeds db/ -default=seeds
autocmd User Rails Rnavcommand steps features/step_definitions -suffix=_steps.rb -default=web
autocmd User Rails Rnavcommand uploader app/uploaders -suffix=_uploader.rb -default=model()
autocmd User Rails Rnavcommand worker app/workers -default=model()

