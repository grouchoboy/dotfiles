# XDG Base Directory
set -gx XDG_CONFIG_HOME "$HOME/.config"

# Default Editors & Pagers
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx LESS "-RiFX"

# PATH configuration
test -d $HOME/.local/bin; and fish_add_path -g -p $HOME/.local/bin
test -d $HOME/.opencode/bin; and fish_add_path -g -p $HOME/.opencode/bin
test -d $HOME/.local/flutter/bin; and fish_add_path -g -p $HOME/.local/flutter/bin

# OS-specific configurations
if test (uname) = Darwin
    # macOS specific configurations
else if test -f /etc/os-release
    set -l os_name (string match -r '^NAME=\"?([^\"\n]+)\"?' < /etc/os-release)[2]
    switch $os_name
        case "Fedora Linux"
            set -gx DATASSD /run/media/manu/DataSSD
            set -gx DATADISK /run/media/manu/DataDisk
            set -gx ANDROID_SDK_ROOT $HOME/Android/Sdk
            set -gx ANDROID_HOME $HOME/Android/Sdk
            test -d $ANDROID_SDK_ROOT/platform-tools; and fish_add_path -g -p $ANDROID_SDK_ROOT/platform-tools
        case "Debian GNU/Linux"
            set -gx DATASSD /media/manu/DataSSD
            set -gx DATADISK /media/manu/DataDisk
    end
end

# mise runtime manager
if command -q mise
    mise activate fish | source
end
