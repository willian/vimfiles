" ****************************************************************
" USING PATHOGEM TO ORGANIZE MY VIM PLUGINS
" ****************************************************************
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

" ****************************************************************
" MODULES
" ****************************************************************
source ~/.vim/modules/visuals.vim
source ~/.vim/modules/file_types.vim
source ~/.vim/modules/indentations.vim
source ~/.vim/modules/functions.vim
source ~/.vim/modules/utils.vim
source ~/.vim/modules/useful_mappings.vim
source ~/.vim/modules/settings.vim
source ~/.vim/modules/nerdcommenter_settings.vim
source ~/.vim/modules/rails_settings.vim
source ~/.vim/modules/rspec_settings.vim
source ~/.vim/modules/search_settings.vim
source ~/.vim/modules/tabularize_settings.vim
source ~/.vim/modules/ctrlp_settings.vim

