CURRENT_PATH=`pwd`

# Linking
rm -f $HOME/.vimrc
rm -f $HOME/.vim
ln -sf $CURRENT_PATH/vimrc $HOME/.vimrc
ln -sf $CURRENT_PATH $HOME/.vim

git clone https://github.com/gmarik/vundle.git $CURRENT_PATH/bundle/vundle
vim +BundleInstall! +qall

unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]]; then
  mkdir -p ~/Library/Vim/{swap,backup,undo}
else
  mkdir -p ~/.local/share/vim/{swap,backup,undo}
fi

echo "Vim           [OK]"

