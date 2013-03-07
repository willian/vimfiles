CURRENT_PATH=`pwd`

# Linking
rm -f $HOME/.vimrc
rm -f $HOME/.vim
ln -sf $CURRENT_PATH/vimrc $HOME/.vimrc
ln -sf $CURRENT_PATH $HOME/.vim

vim +BundleInstall! +qall

echo "Vim           [OK]"

