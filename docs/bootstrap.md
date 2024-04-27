## vim

install plug

https://github.com/junegunn/vim-plug

```sh
sudo dnf5 install vim-enhanced -y

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


ln -s /home/manu/dotfiles/vimrc /home/manu/.vimrc
```

Open vim and type `:PlugInstall`