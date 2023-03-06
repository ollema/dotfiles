# dotfiles

## darwin install instructions

1. install certificates, VPN and other apps through self service
2. set default shell to `/bin/zsh` in Terminal
3. run install script:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://raw.githubusercontent.com/ollema/dotfiles/main/install-darwin | bash
```

4. maybe update login shell with `chsh -s` even though it should not be needed
5. restore configs from `home/config` for iTerm2, raycast etc...
6. install bitwarden safari extension
7. log with AppleID, autodesk account, guitar pro account...
8. setup TouchID
