# satoso's dotfiles

Setup:

```bash
# if appropriate
# git config --global user.name "satoso"
# git config --global user.email "satoso@users.noreply.github.com"

mkdir -p ~/src/github.com/satoso
cd ~/src/github.com/satoso
git clone https://github.com/satoso/dotfiles.git
cd dotfiles

git config user.name "satoso"
git config user.email "satoso@users.noreply.github.com"

bash xdgsetup.sh
bash symlink.sh
bash .vim/pack/myplugins/setup.sh

echo 'export EDITOR=vim' >> ~/.profile
```
