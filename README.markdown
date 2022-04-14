# satoso's dotfiles

Setup:

```bash
git config --global user.name "satoso"
git config --global user.email "satoso@users.noreply.github.com"

mkdir -p ~/src/github.com/satoso
cd ~/src/github.com/satoso
git clone https://github.com/satoso/dotfiles.git 

# if appropriate
# ln -si `pwd`/.bash_profile ~/.bash_profile
# ln -si `pwd`/.bashrc ~/.bashrc

ln -sni `pwd`/.vim ~/.vim
# then install vim-plug ( https://github.com/junegunn/vim-plug )

echo "export EDITOR=vim" >> ~/.bashrc
```
