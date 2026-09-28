# Multi-Machine NixOS Flake Configuration

Modular NixOS configuration powered by Nix Flakes, designed to be shared across multiple physical and virtual machines.

---

## 📁 Directory Structure

```text
nixos/
├── flake.nix                       # Flake entrypoint & host definitions
├── hosts/
│   ├── common/                     # Configuration shared by ALL machines
│   │   ├── default.nix             # Aggregator (imports all common modules)
│   │   ├── core.nix                # Flakes settings, GC, unfree packages, stateVersion
│   │   ├── locale.nix              # Timezone, locale (en_US / es_ES), keymap
│   │   ├── users.nix               # User account (manu) and group permissions
│   │   ├── packages.nix            # Core CLI tools (git, neovim, stow, etc.)
│   │   └── fonts.nix               # System fonts (Caskaydia Mono Nerd Font)
│   │
│   ├── vm/                         # Current host (QEMU/KVM virtual machine)
│   │   ├── default.nix             # Hostname, bootloader (GRUB), enabled modules
│   │   └── hardware-configuration.nix
│   │
│   └── example/                    # Template blueprint for adding a new machine (e.g. laptop)
│       ├── default.nix             # UEFI systemd-boot example
│       └── hardware-configuration.nix
│
└── modules/                        # Opt-in feature modules & profiles
    ├── default.nix                 # Imports all modules
    ├── desktop/
    │   ├── gnome.nix               # GNOME desktop environment & GDM
    │   └── apps.nix                # GUI applications (firefox, ghostty, bitwarden)
    ├── services/
    │   ├── audio.nix               # PipeWire audio & rtkit
    │   └── printing.nix            # CUPS printing
    └── virtualization/
        └── qemu.nix                # QEMU guest agent & SPICE vdagentd
```

---

## 🚀 Quick Usage

> **Important**: Nix flakes only read files tracked by Git. Whenever you create or modify files, remember to stage them:
> ```bash
> git add nixos/
> ```

### Rebuild and Switch
Apply configuration changes to the active machine:
```bash
# Using the Makefile in nixos/:
make switch

# Or directly with nixos-rebuild:
sudo nixos-rebuild switch --flake .#vm
```

### Test Changes Without Adding to Bootloader
```bash
# Using the Makefile in nixos/:
make test

# Or directly:
sudo nixos-rebuild test --flake .#vm
```

### Update Flake Lockfile
To update all flake inputs (packages & NixOS channels) to their latest versions:
```bash
# Using the Makefile in nixos/:
make update

# Or directly:
nix flake update
```

### Validate Configuration
```bash
make check
```

---

## 💻 Adding a New Machine

To configure a new machine (for example, a laptop named `thinkpad`):

1. **Copy the example template**:
   ```bash
   cp -r hosts/example hosts/thinkpad
   ```

2. **Generate hardware scan on the target machine**:
   ```bash
   nixos-generate-config --show-hardware-config > hosts/thinkpad/hardware-configuration.nix
   ```

3. **Configure machine settings**:
   Edit `hosts/thinkpad/default.nix`:
   - Set `networking.hostName = "thinkpad";`
   - Adjust bootloader (`systemd-boot` for UEFI, `grub` for legacy BIOS)
   - Enable/disable modules as needed:
     ```nix
     modules = {
       desktop.gnome.enable = true;
       services.audio.enable = true;
       # virtualization is omitted on bare-metal hardware
     };
     ```

4. **Register the new host in `flake.nix`**:
   Add the new host entry under `nixosConfigurations`:
   ```nix
   nixosConfigurations = {
     vm = mkHost { hostname = "vm"; };
     thinkpad = mkHost { hostname = "thinkpad"; };
   };
   ```

5. **Stage and apply**:
   ```bash
   git add hosts/thinkpad flake.nix
   sudo nixos-rebuild switch --flake .#thinkpad
   ```
