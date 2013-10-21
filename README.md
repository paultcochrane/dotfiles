A collection of my dotfiles
===========================

In order for the dotfiles to work, one needs to follow the installation
instructions for the respective software package.

awesome
-------

    sudo aptitude install awesome awesome-extras
    sudo aptitude install gnome-icon-theme
    sudo aptitude install sensors-applet
    sudo aptitude install lua-expat
    sudo aptitude install liblua5.1-socket2
    ln -s $HOME/dotfiles/.config $HOME/.config
    cd $HOME/dotfiles
    git submodule update
    git submodule init
    cd $HOME/dotfiles/.config/awesome/delightful_repo
    git submodule update
    git submodule init

NOTE: The list of packages here might not be complete.

ghci
----

    sudo aptitude install ghc-ghci
    ln -s $HOME/dotfiles/.ghci $HOME/.ghci

irssi
-----

    sudo aptitude install irssi
    ln -s $HOME/dotfiles/.irssi $HOME/.irssi

screen
------

    sudo aptitude install screen
    ln -s $HOME/dotfiles/.screen $HOME/.screen

newsbeuter
----------

    sudo aptitude install newsbeuter
    ln -s $HOME/dotfiles/.newsbeuter $HOME/.newsbeuter

vim
---

    sudo aptitude install vim
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

Install the pathogen plugin:

    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -Sso ~/.vim/autoload/pathogen.vim \
	https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

Install the Command-T plugin:

    wget http://s3.wincent.com/command-t/releases/command-t-1.5.1.vba
    vim --cmd 'source command-t-1.5.1.vba | q!'
    cd ~/.vim/ruby/command-t
    ruby extconf.rb
    make

Install the unimpaired plugin:

    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-unimpaired.git

xpdf
----

    sudo aptitude search xpdf
    ln -s $HOME/dotfiles/.xpdfrc $HOME/.xpdfrc
