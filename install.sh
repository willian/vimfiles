VIMFILES_PATH=`pwd`
# Generating the symlinks
if [ ! -d ~/.vim ]; then
  ln -sf $VIMFILES_PATH ~/.vim
fi
ln -sf "${VIMFILES_PATH}/vimrc" ~/.vimrc

# Updating submodules
git submodule init
git submodule update

# Installing pathogen.vim
if [ ! -d ~/.vim/autoload ]; then
  mkdir -p ~/.vim/autoload
fi
ln -sf "${VIMFILES_PATH}/bundles/pathogen/autoload/pathogen.vim" ~/.vim/autoload/pathogen.vim 

# Installing Command-T plugin
cd ~/.vim/bundles/Command-T/ruby/command-t && ruby extconf.rb && make

echo "Done!"
