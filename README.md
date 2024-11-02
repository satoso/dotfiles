# satoso's dotfiles

Setup:

```bash
mkdir -p ~/src/github.com/satoso
cd ~/src/github.com/satoso
git clone https://github.com/satoso/dotfiles.git
cd dotfiles

bash xdgsetup.sh
bash symlink.sh
bash .vim/pack/myplugins/setup.sh

echo 'export EDITOR=vim' >> ~/.profile

git config user.name "satoso"
git config user.email "satoso@users.noreply.github.com"
# if appropriate
# git config --global user.name "satoso"
# git config --global user.email "satoso@users.noreply.github.com"
```
