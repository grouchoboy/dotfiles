# Replicates starship's vimcmd_symbol = "[❮](green)"
# Shows a green ❮ before the prompt while in vi-mode normal mode.
# In insert mode (or without vi-mode enabled) nothing is shown.
function fish_mode_prompt
    if test "$fish_key_bindings" = fish_vi_key_bindings; and test "$fish_bind_mode" = default
        set_color 79740e # gruvbox light: green
        echo -n '❮ '
        set_color normal
    end
end
