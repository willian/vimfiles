CURRENT_PATH=`pwd`

# Linking
rm -f $HOME/.vimrc
rm -f $HOME/.vim
ln -sf $CURRENT_PATH/vimrc $HOME/.vimrc
ln -sf $CURRENT_PATH $HOME/.vim

git clone https://github.com/gmarik/vundle.git $CURRENT_PATH/bundle/vundle
vim +BundleInstall! +qall

echo "Vim           [OK]"

