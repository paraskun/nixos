#!/bin/sh

if [ ! -d "/nix" ]; then
  curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install \
    | sh -s -- --no-daemon
fi

export PATH=$HOME/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$PATH

NIX_CONFIG="experimental-features = nix-command flakes" \
  nix run home-manager -- switch --flake .#$1
