" ****************************************************************
" USING PATHOGEM TO ORGANIZE MY VIM PLUGINS
" ****************************************************************
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
endif

" ****************************************************************
" MODULES
" ****************************************************************
source ~/.vim/modules/visuals.vim
source ~/.vim/modules/file_types.vim
source ~/.vim/modules/indentations.vim
source ~/.vim/modules/functions.vim
source ~/.vim/modules/settings.vim
source ~/.vim/modules/search_settings.vim
source ~/.vim/modules/rails_settings.vim
source ~/.vim/modules/nerdcommenter_settings.vim
source ~/.vim/modules/tabularize_settings.vim
source ~/.vim/modules/rspec_settings.vim
source ~/.vim/modules/useful_mappings.vim

