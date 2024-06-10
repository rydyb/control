# Control

Extends [ARTIQ](https://github.com/m-labs/artiq) for our lab.

## Setup

Install [nix](https://nix.dev/) and enable experimental features
```shell
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
```

## Usage

Enter the development environment:
```shell
nix develop .
```