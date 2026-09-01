#!/bin/sh

curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install \
  | sh -s -- --no-daemon

nix --extra-experimental-features "nix-command flakes" \
  run home-manager -- switch --flake .#$1
