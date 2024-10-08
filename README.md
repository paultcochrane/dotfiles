A collection of my dotfiles
===========================

In order for the dotfiles to work, one needs to follow the installation
instructions for the respective software package.

## Initial setup

    su -
    apt install sudo vim tmux git awesome alacritty mutt xscreensaver irssi moc

abcde
-----

    sudo apt install abcde eyed3 lame python3-pylast
    ln -s $HOME/dotfiles/.abcde.conf $HOME/.abcde.conf

alacritty
---------

    mkdir -p $HOME/.config/alacritty
    ln -s $HOME/dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

awesome
-------

Install the necessary packages

    sudo apt install awesome awesome-extra\
	gnome-icon-theme\
	sensors-applet\
	lua-expat

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

Set up the awesome-wm-widgets repository

    cd $HOME/dotfiles/awesome
    git clone git@github.com:streetturtle/awesome-wm-widgets.git

Download and install the Arc icons (required for awesome-wm-widgets)

    git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
    ./autogen.sh --prefix=/usr
    sudo make install

Make sure that libgweather's locations file is in the expected format for
`aweseome`.

    sudo gunzip /usr/share/libgweather/Locations.xml.gz

Ensure that `xscreensaver` is installed so that the screensaver
functionality works.

    sudo apt install xscreensaver

NOTE: The list of packages here might not be complete.

Create the following text as `/usr/share/xsessions/awesome.desktop`

    [Desktop Entry]
    Encoding=UTF-8
    Name=awesome
    Comment=Highly configurable framework window manager
    NoDisplay=false
    TryExec=awesome
    Exec=awesome
    Type=Application

this will allow awesome to appear as a display manager option.  Note that
`NoDisplay` is set to `false`!  If it is left at its `true` value, awesome
won't turn up in the menu.

This setup for aweseome also requires the `pa-applet` Gnome applet.  This
applet is no longer contained in Gnome or in fact associated with the
PulseAudio project anymore.  Nevertheless, it's useful for the setup here.
To install it, clone the repository and enter the repo directory:

    git clone git@github.com:fernandotcl/pa-applet.git
    cd pa-applet

To build the sources, the following packages need to be installed:

    sudo apt install autoconf automake libglib2.0-dev libgtk-3-dev \
	libnotify-dev libpulse-dev libx11-dev pkg-config

Now configure and build the project

    autoreconf --install
    ./configure
    make

It could be that the build barfs with an error about a deprecated function.
If this is the case, remove the `-Werror` flag from `src/Makefile.in` and
`src/Makefile.am`, rerun `autoreconf` and `./configure` and run `make`.

Once the binary has been built, copy it into the `$HOME/bin` directory:

    cp src/pa-applet $HOME/bin

bash
----

    ln -sf $HOME/dotfiles/.bashrc $HOME/.bashrc
    ln -sf $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases

bash-completion
---------------

    sudo apt install bash-completion

ghci
----

    sudo apt install ghc-ghci
    ln -s $HOME/dotfiles/.ghci $HOME/.ghci

git
---

    sudo apt install git
    ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
    ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global

inputrc
-------

    ln -s $HOME/dotfiles/.inputrc $HOME/.inputrc

irssi
-----

    sudo apt install irssi
    ln -s $HOME/dotfiles/.irssi $HOME/.irssi

mailcap
-------

    ln -s $HOME/dotfiles/.mailcap $HOME/.mailcap

mocp
----

There aren't any dotfiles for this, but it's handy to have around.

    sudo apt install moc

mutt
----

    sudo apt install mutt
    ln -s $HOME/dotfiles/.muttrc_defaults $HOME/.muttrc_defaults
    ln -s $HOME/dotfiles/.muttrc_colours $HOME/.muttrc_colours

newsboat
--------

    sudo apt install newsboat
    ln -s $HOME/dotfiles/.newsboat $HOME/.newsboat

screen
------

    sudo apt install screen
    ln -s $HOME/dotfiles/.screenrc $HOME/.screenrc

tmux
----

Install `tmux` and link the dotfile:

    sudo apt install tmux
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

Install tmux-mem-cpu-load in `$HOME/bin`:

    sudo apt install cmake g++
    git clone https://github.com/thewtex/tmux-mem-cpu-load.git
    cd tmux-mem-cpu-load
    cmake .
    make
    if [ ! -d "$HOME/bin" ]; then mkdir -p $HOME/bin; fi
    cp tmux-mem-cpu-load $HOME/bin

vim
---

Install `vim` and link the dotfile:

    sudo apt install vim vim-gtk
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

`vim-gtk` is necessary so that Ruby support is available in `vim` so that
the `Command-T` plugin works.

Install the [pathogen](https://github.com/tpope/vim-pathogen) plugin:

```shell
sudo apt install vim-pathogen
```

Install the [ctrlp](https://github.com/ctrlpvim/ctrlp.vim) plugin:

    cd ~/.vim
    git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim

Install the [Command-T](https://wincent.com/products/command-t) plugin:

    sudo apt install -y ruby ruby-dev make
    cd ~/.vim
    git clone https://github.com/wincent/command-t.git bundle/command-t
    cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/
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

Install the [Vim Better
Whitespace](http://github.com/ntpeters/vim-better-whitespace/ ) plugin:

    cd ~/.vim/bundle
    git clone https://github.com/ntpeters/vim-better-whitespace.git

Since `flake8` is used to run Python syntax checking, the `flake8` package
is also required:

    sudo apt install flake8

Install the [vim-airline](https://github.com/vim-airline/vim-airline) plugin:

    git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

then run `:Helptags` to generate help tags.

xmodmap
-------

    ln -s $HOME/dotfiles/.xmodmap $HOME/.xmodmap

xpdf
----

    sudo apt install xpdf
    ln -s $HOME/dotfiles/.xpdfrc $HOME/.xpdfrc

xplanet
-------

    sudo apt install xplanet
    ln -s $HOME/dotfiles/.xplanet $HOME/.xplanet
    mkdir $HOME/.xplanet/cloud_maps

Link script to update the cloud maps into `~/bin`:

    ln -s $HOME/.xplanet/update_cloud_maps.sh $HOME/bin/

Run `xplanet` like so:

    xplanet -latitude 54.4 -longitude 9.7 -transparency

xsession
--------

    ln -s $HOME/dotfiles/.xsession $HOME/.xsession
