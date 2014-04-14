A collection of my dotfiles
===========================

In order for the dotfiles to work, one needs to follow the installation
instructions for the respective software package.

abcde
-----

    ln -s $HOME/dotfiles/.abcde.conf $HOME/.abcde.conf

awesome
-------

Install the necessary packages

    sudo aptitude install awesome awesome-extra\
	gnome-icon-theme\
	sensors-applet\
	lua-expat\
	liblua5.1-socket2

Link the HOME directory appropriately

    ln -s $HOME/dotfiles/awesome $HOME/.config/awesome
    cd $HOME/dotfiles

Set up the delightful submodule/subrepo

    git submodule init
    git submodule update

Set up delightful's submodules

    cd $HOME/dotfiles/awesome/delightful_repo
    git submodule init
    git submodule update

Make sure that libgweather's locations file is in the expected format for
`aweseome`.

    sudo gunzip /usr/share/libgweather/Locations.xml.gz

NOTE: The list of packages here might not be complete.

bash
----

    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc

bash-completion
---------------

    sudo aptitude install bash-completion

devtodo
-------

The configuration for `devtodo` is in `.bashrc`.

    sudo aptitude install devtodo

ghci
----

    sudo aptitude install ghc-ghci
    ln -s $HOME/dotfiles/.ghci $HOME/.ghci

inputrc
-------

    ln -s $HOME/dotfiles/.inputrc $HOME/.inputrc

irssi
-----

    sudo aptitude install irssi
    ln -s $HOME/dotfiles/.irssi $HOME/.irssi

mutt
----

    sudo aptitude install mutt
    ln -s $HOME/dotfiles/.muttrc_defaults $HOME/.muttrc_defaults
    ln -s $HOME/dotfiles/.muttrc_colours $HOME/.muttrc_colours

newsbeuter
----------

    sudo aptitude install newsbeuter
    ln -s $HOME/dotfiles/.newsbeuter $HOME/.newsbeuter

screen
------

    sudo aptitude install screen
    ln -s $HOME/dotfiles/.screenrc $HOME/.screenrc

vim
---

Install `vim` and link the dotfile:

    sudo aptitude install vim vim-gtk
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

`vim-gtk` is necessary so that Ruby support is available in `vim` so that
the `Command-T` plugin works.

Install the [pathogen](https://github.com/tpope/vim-pathogen) plugin:

    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -Sso ~/.vim/autoload/pathogen.vim \
	https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

Install the [Command-T](https://wincent.com/products/command-t) plugin:

    sudo aptitude install ruby-dev make
    wget http://s3.wincent.com/command-t/releases/command-t-1.5.1.vba
    vim --cmd 'source command-t-1.5.1.vba | q!'
    cd ~/.vim/ruby/command-t
    ruby extconf.rb
    make

Install the [unimpaired](https://github.com/tpope/vim-unimpaired) plugin:

    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-unimpaired.git

Install the [fugitive](https://github.com/tpope/vim-fugitive) plugin:

    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-fugitive.git

If the help for the given package can't be found and/or if the commands for
the given package don't show up, just run `:Helptags`.

Install the [syntastic](https://github.com/scrooloose/syntastic) plugin:

    cd ~/.vim/bundle
    git clone https://github.com/scrooloose/syntastic.git

xmodmap
-------

    ln -s $HOME/dotfiles/.xmodmap $HOME/.xmodmap

xpdf
----

    sudo aptitude install xpdf
    ln -s $HOME/dotfiles/.xpdfrc $HOME/.xpdfrc

xsession
--------

    ln -s $HOME/dotfiles/.xsession $HOME/.xsession
