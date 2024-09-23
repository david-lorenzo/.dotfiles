# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH=/usr/local/go/bin:$PATH

. "$HOME/.cargo/env"

export LIBVA_DRIVER_NAME=i965
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_X11_EGL=1

# from: https://zameermanji.com/blog/2012/12/30/using-vim-as-manpager/
export VIEW=/home/david/local/vim/bin/view
export MANPAGER="/bin/sh -c \"col -b | $VIEW -c 'set ft=man ts=8 nolist hidden' -\""
