# dotfiles

## darwin install instructions
1. install certificates, VPN and other apps through self service
2. configure default shell:
    * open Terminal
    * <kbd>command</kbd> + <kbd>,</kbd>
    * set Shells open with: `/bin/zsh`
3. install/update command line tools and homebrew:
```bash
curl -fsSL https://raw.githubusercontent.com/ollema/dotfiles/main/install-darwin | bash
```
4. install nix:
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
````
5. 
