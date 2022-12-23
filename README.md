```
ln -s $HOME/dotfile/tmux.conf $HOME/.tmux.conf
tmux
C-a I # install tmux plugins
```

For copy paste to work on install `reattach-to-user-space`

```
brew install reattach-to-user-space
```

## Tmux

### Windows


| keybinding | action          |
|------------|-----------------|
| prefix ,   | rename window   |
| prefix c   | create window   |
| prefix n   | next window     |
| prefix p   | previous window |
| prefix &   | kill window     |
| prefix $   | rename window   |

### Panes

| keybinding | action            |
|------------|-------------------|
| prefix %   | split vertical    |
| prefix "   | split horizontal  |
| prefix x   | kill current pane |

### Sessions

- `tmux a -t <session-name>` attach to session
- `tmux kill-session -t <session-name>` kill session

