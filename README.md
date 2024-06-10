# Control

Extends [ARTIQ](https://github.com/m-labs/artiq) for our lab.

## Setup

Install [nix](https://nix.dev/) and enable experimental features
```shell
mkdir -p ~/.config/nix
cat << EOF >> ~/.config/nix/nix.conf
experimental-features = nix-command flakes
accept-flake-config = true
EOF
```

## Usage

Enter the development environment:
```shell
nix develop .
```