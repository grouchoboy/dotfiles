# ssh

## ssh agent

```
mkdir -p ~/.config/systemd/user
ln -s /home/manu/dotfiles/docs/ssh-agent.service /home/manu/.config/systemd/user
systemctl --user enable --now ssh-agent.service
```

