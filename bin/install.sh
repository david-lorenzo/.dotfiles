#!/usr/bin/env sh

msg()
{
	timestamp=`date '+%Y-%m-%d %H:%M:%S'`
	echo "$timestamp - $1"
}

info()
{
	msg "INFO    - $1"
}

warning()
{
	msg "WARNING - $1"
}

error()
{
	msg "ERROR   - $1"
}

fatal()
{
	msg "FATAL   - $1"
	exit 1
}

create_link()
{
	symlink=`realpath -s $1`
	target=`realpath -s $2`
	do_create=1
	if [ -e $symlink ]; then
		warning "'$symlink' exists"
		if [ -h $symlink ]; then
			info "'$symlink' is a symlink"
			link_target=`realpath $symlink`
			if [ $link_target = $target ]; then
				info "'$symlink' already points to '$target', we do nothing"
				do_create=0
			else
				warning "'$symlink' points to '$link_target' when it should point to '$target'"
				info "removing '$symlink'"
				rm -f $symlink
				if [ $? -ne 0 ]; then
					error "could not delete '$symlink', aborting operation"
					do_create=0
				fi
			fi
		else
			info "'$symlink' is a regular file or directory"
			bck_entry=`mktemp -u ${symlink}.XXX`
			warning "$symlink exists, creating a backup in $bck_entry"
			mv $symlink $bck_entry
			if [ $? -ne 0 ]; then
				error "could not create $bck_entry backup. Skipping symlink creation"
				do_create=0
			fi
		fi
	fi

	if [ $do_create -eq 1 ]; then
		info "creating link: $symlink target: $target"
		ln -s $target $symlink
		[ $? -ne 0 ] && error "could not create link $symlink to target: $target"
	fi
}

sudo apt-get update

# checkout repository
GIT_REPO="https://github.com/david-lorenzo/.dotfiles.git"
if [ ! -e ~/.dotfiles ]; then
	sudo apt-get install -y git
	cd ~
	git clone --recurse-submodules $GIT_REPO
	if [ $? -ne 0 ]; then
		fatal "Could not clone git repository: ${GIT_REPO}"
	fi
fi

# configuring vim
sudo apt-get install -y vim
create_link ~/.vim     ~/.dotfiles/.vim
create_link ~/.vimrc   ~/.dotfiles/.vimrc
