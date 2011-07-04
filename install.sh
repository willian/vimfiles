VIMFILES_PATH=`pwd`

# Generating the symlinks
if [ ! -d ~/.vim ]; then
  ln -sf $VIMFILES_PATH ~/.vim
fi
ln -sf "${VIMFILES_PATH}/vimrc" ~/.vimrc

# Managing bundles
mkdir -p "${VIMFILES_PATH}/bundles"

get_bundle() {
  (
  if [ -d "${VIMFILES_PATH}/$3" ]; then
    echo "Updating $1's $2 on ${VIMFILES_PATH}/$3"
    cd "${VIMFILES_PATH}/$3"
    git pull --rebase
    cd $VIMFILES_PATH
  else
    git clone "git://github.com/$1/$2.git" "$3"
    if [[ "$2" = "git-tmbundle.git" ]]; then
      gem install git
    fi
  fi
  )
}

get_bundle duff vim-bufonly bundles/bufonly
get_bundle godlygeek tabular bundles/tabular
get_bundle leshill vim-json bundles/json
get_bundle mileszs ack.vim bundles/ack
get_bundle pangloss vim-javascript bundles/javascript
get_bundle scrooloose nerdcommenter bundles/nerdcommenter
get_bundle therubymug vim-pyte bundles/pyte
get_bundle tpope vim-abolish bundles/abolish
get_bundle tpope vim-cucumber bundles/cucumber
get_bundle tpope vim-endwise bundles/endwise
get_bundle tpope vim-flatfoot bundles/flatfoot
get_bundle tpope vim-fugitive bundles/fugitive
get_bundle tpope vim-git bundles/git
get_bundle tpope vim-haml bundles/haml
get_bundle tpope vim-markdown bundles/markdown
get_bundle tpope vim-pathogen bundles/pathogen
get_bundle tpope vim-ragtag bundles/ragtag
get_bundle tpope vim-rails bundles/rails
get_bundle tpope vim-repeat bundles/repeat
get_bundle tpope vim-speeddating bundles/speeddating
get_bundle tpope vim-surround bundles/surround
get_bundle tpope vim-unimpaired bundles/unimpaired
get_bundle wincent Command-T bundles/Command-T
get_bundle akitaonrails snipmate-snippets snippets
get_bundle akitaonrails snipmate.vim bundles/snipmate
get_bundle itspriddle vim-lesscss bundles/lesscss
get_bundle csexton rvm.vim bundles/rvm
get_bundle bwyrosdick vim-blackboard bundles/vim-blackboard
get_bundle Raimondi delimitMate bundles/delimitMate

# Installing pathogen.vim
if [ ! -d ~/.vim/autoload ]; then
  mkdir -p ~/.vim/autoload
fi
ln -sf "${VIMFILES_PATH}/bundles/pathogen/autoload/pathogen.vim" ~/.vim/autoload/pathogen.vim

# Installing Command-T plugin
GEMSET_NAME=`rvm gemset name`
RUBY_VERSION=`ruby -e "puts RUBY_VERSION"`
rvm use system
cd ~/.vim/bundles/Command-T/ruby/command-t && ruby extconf.rb && make
rvm use $RUBY_VERSION@$GEMSET_NAME

echo "Done!"

