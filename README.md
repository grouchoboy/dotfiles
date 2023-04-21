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

## Nvim

### Find

All of the following keybindings are preceded by the leader key

| keybinding | action                    |
|------------|---------------------------|
| ff         | find fies                 |
| fg         | live grep                 |
| fb         | buffers                   |
| fl         | fuzzy find current buffer |
| fh         | help tags                 |
| c          | commands                  |

| keybinding | action            |
|------------|-------------------|
| ls         | document symbols  |
| lw         | workspace symbols |
| ld         | definitions       |
| li         | implementations   |
| ltd        | type definitions  |
| lr         | references        |


## Emacs

```
mkir ~/.emacs.d # if emacs conf dir does not exists
ln -s ~/dotfiles/init.el ~/.emacs.d/init.el
```


### Keybindings

#### Custom

- Leader key `SPC`

| keybinding | action                |
|------------|-----------------------|
| x 1        | delete other windows  |
| x 3        | split window right    |
| o          | move to other window  |
| k          | kill buffer           |
| x f        | find file             |
| d          | dired                 |
| e          | eval last s-expresion |

#### Projectile

| keybinding | action           |
|------------|------------------|
| p          | command map      |
| f          | find file        |
| b          | switch to buffer |


#### Counsel

| keybinding | action        |
|------------|---------------|
| s          | isearch       |
| x b        | switch buffer |
