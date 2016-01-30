satoso's dotfiles.

usage:

```bash
# clone recursively (i.e. along with inner submodules)
git clone --recursive git@github.com:satoso/dotfiles.git ~/dotfiles
```

First, be sure to set the identity repository-locally (in `.git/config` ).

```bash
cd ~/dotfiles
git config user.name "satoso"
git config user.email "satoso@users.noreply.github.com"
```

Symlink things.

```bash
cd ~/dotfiles
# -n option is needed for replacing links to a directory.
ln -si `pwd`/.bash_profile ~/.bash_profile
ln -si `pwd`/.bashrc ~/.bashrc
ln -si `pwd`/.vimrc ~/.vimrc
ln -si `pwd`/.gvimrc ~/.gvimrc
ln -sni `pwd`/.vim ~/.vim

# If appropriate:
ln -si `pwd`/.gitconfig ~/.gitconfig
ln -si `pwd`/.gitignore_global ~/.gitignore_global
```

Symlink Windows version:

```bat
:: on Command Prompt with admin authority
:: syntax: mklink <option> <link> <target>
mklink "%USERPROFILE%\.bash_profile" "%USERPROFILE%\dotfiles\.bash_profile"
mklink "%USERPROFILE%\.bashrc" "%USERPROFILE%\dotfiles\.bashrc"
mklink "%USERPROFILE%\_vimrc" "%USERPROFILE%\dotfiles\.vimrc"
mklink "%USERPROFILE%\_gvimrc" "%USERPROFILE%\dotfiles\.gvimrc"
mklink /D "%USERPROFILE%\vimfiles" "%USERPROFILE%\dotfiles\.vim"
```
