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

if [[ -f /etc/debian_version ]]; then
  sudo apt-get install -y python-twisted
else
  echo ""
  echo "You are running outside a Debian/Ubuntu machine"
  echo "and you need to install Python Twisted lib."
  echo ""
  echo "You can try it: pip install twisted"
  echo "or visit: http://twistedmatrix.com/trac/wiki/Downloads#MacOSX"
  echo ""
  echo ""
fi

echo "Vim           [OK]"

