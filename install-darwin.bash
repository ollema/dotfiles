#!/bin/bash
# shellcheck disable=SC1091

{ # prevent script from running if partially downloaded

set -euo pipefail

DOTFILES_REPO="https://github.com/ollema/dotfiles.git"
HOSTNAME="$(hostname)"

sudo_prompt() {
  echo "please enter your password for sudo authentication"
  sudo -k
  sudo echo "sudo authentication successful!"
  while true ; do sudo -n true ; sleep 60 ; kill -0 "$$" || exit ; done 2>/dev/null &
}

install_command_line_tools() {
  # unattended installation of Command Line Tools
  xcode-select -p >/dev/null || {
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    CLT=$( softwareupdate -l |
      grep "\*.*Command Line Tools" |
      head -n 1 |
      awk -F ":" '{print $2}' |
      sed -e 's/^ *//' |
      tr -d '\n' )
    softwareupdate -i "$CLT" --verbose
    rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  }
  echo "Command Line Tools installed at $(xcode-select -p)"
}

install_nix() {
  command -v nix >/dev/null || {
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  }
  echo "nix installed"
}

install_brew() {
  [ -f /opt/homebrew/bin/brew ] || {
    NONINTERACTIVE=1 /bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf -L https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  }
  echo "brew installed"
}

create_run_directory() {
  if sudo grep -q '^run\b' /etc/synthetic.conf
  then
    echo "/run directory already exists"
  else
    echo -e "run\tprivate/var/run" | sudo tee -a /etc/synthetic.conf
    sudo /System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t
    echo "/run directory created"
  fi
}

clone_repository() {
  if ! grep -q "${DOTFILES_REPO}" "${HOME}/dotfiles/.git/config"
  then
    rm -rf "${HOME}/dotfiles"
    git clone "${DOTFILES_REPO}" "${HOME}/dotfiles"
  fi
  echo "dotfiles repo cloned"
}

darwin_build() {
  command -v darwin-rebuild || {
    for filename in shells bashrc zshrc nix/nix.conf; do
      filepath="/etc/${filename}"
      if [ -f "${filepath}" ] && [ ! -L "${filepath}" ]; then
        sudo mv "${filepath}" "${filepath}.backup-before-nix-darwin"
      fi
    done

    cd "${HOME}/dotfiles"

    nix build ".#darwinConfigurations.${HOSTNAME}.system" --extra-experimental-features "nix-command flakes"
    ./result/sw/bin/darwin-rebuild switch --flake .
  }
  echo "nix-darwin built and activated!"
}

# installation flow
sudo_prompt
install_command_line_tools
install_nix
install_brew
create_run_directory
clone_repository
darwin_build

} # prevent script from running if partially downloaded
