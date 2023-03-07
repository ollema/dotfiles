# dotfiles

fully-declarative system configuration using `nix` and `nix-darwin` - with flakes!

## install instructions

1. install certificates, VPN and other apps through self service
2. set default shell to `/bin/zsh` in Terminal
3. run install script:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://raw.githubusercontent.com/ollema/dotfiles/main/install-darwin.bash | bash
```

4. maybe update login shell with `chsh -s` even though it should not be needed
5. restore configs from `home/config` for iTerm2 and raycast
6. install bitwarden safari extension
7. log with AppleID, autodesk, guitar pro accounts
8. setup TouchID

note: reboot might be needed for the `nix-darwin` system configuration to take effect

## after macos system update

a system update will reset system files and break existing configuration, this means shell configuration in `/etc` and system services will be lost. luckily it's easy to get back up and running:

```bash
sudo mv /etc/bashrc /etc/bashrc.orig
sudo mv /etc/zshrc /etc/zshrc.orig
sudo mv /etc/zprofile /etc/zprofile.orig
sudo /nix/var/nix/profiles/system/activate
exit  # Start a new shell to reload the environment.
```

this will activate the last configuration again, after this the system is ready and nix should be fully operational again.

## goals

- [x] installs Command Line Tools silently
- [x] installs nix
- [x] clones this repo to the local machine
- [x] initiates the first `darwin-rebuild` to switch configurations

## layout

- `darwin/` - darwin-specific configuration
- `home/` - home-manager configuration and dotfile management

## inspiration

heavily inspired by:

- https://github.com/the-nix-way/nome
- https://github.com/matchai/dotfiles
