CURRENT_PATH=`pwd`

git submodule init
git submodule update
git submodule foreach git pull origin master

# Linking
rm -f $HOME/.vimrc
rm -f $HOME/.vim
ln -sf $CURRENT_PATH/vimrc $HOME/.vimrc
ln -sf $CURRENT_PATH $HOME/.vim

vim -c 'call pathogen#helptags()|q'

echo "Vim           [OK]"

