satoso's dotfiles.

usage:

```bash
git clone git@github.com:satoso/dotfiles.git ~/dotfiles
cd ~/dotfiles

# First, be sure to set the identity repository-locally (in .git/config ).
git config user.name "satoso"
git config user.email "satoso@users.noreply.github.com"

# Then symlink things.
# -n option is needed for replacing links to a directory.
ln -si `pwd`/.vimrc ~/.vimrc
ln -si `pwd`/.gvimrc ~/.gvimrc
ln -sni `pwd`/.vim ~/.vim
ln -si `pwd`/.bash_profile ~/.bash_profile
ln -si `pwd`/.bashrc ~/.bashrc
ln -si `pwd`/.gitconfig ~/.gitconfig
ln -si `pwd`/.gitignore_global ~/.gitignore_global
```
