#!/bin/sh

if [[ ! -d "/nix" ]]; then
  curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install \
    | sh -s -- --no-daemon
fi

. ~/.nix-profile/etc/profile.d/nix.sh

nix --extra-experimental-features "nix-command flakes" \
  run home-manager -- switch --flake .#$1
