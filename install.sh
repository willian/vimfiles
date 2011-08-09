CURRENT_PATH=`pwd`

git submodule init
git submodule update

if [ -d $HOME/.vim ]; then
  rm -rf $HOME/.vim
fi

# Linking
ln -sf $CURRENT_PATH/vimrc $HOME/.vimrc
ln -sf $CURRENT_PATH $HOME/.vim

echo "Vim           [OK]"
