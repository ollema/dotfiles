# dotfiles

## darwin install instructions
1. install certificates, VPN and other apps through self service
2. set default shell to `/bin/zsh` in Terminal
3. run install script:
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://raw.githubusercontent.com/ollema/dotfiles/main/install-darwin | bash
```
4. maybe update login shell with `chsh -s` even though it should not be needed
5. install apps which do not work well with nix/homebrew: discord
