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

newsbeuter
----------

    sudo aptitude install newsbeuter
    ln -s $HOME/dotfiles/.newsbeuter $HOME/.newsbeuter
