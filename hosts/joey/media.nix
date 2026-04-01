{ config, pkgs, ...}:
{
  imports = [
    ./../../modules/jellyfin/default.nix
  ];
}
