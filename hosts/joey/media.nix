{ config, pkgs, ...}:
{
  services.jellyfin = {
    enable = true;
    package = pkgs.jellyfin;
    user = "jellyfin";
    group = "jellyfin";
    openFirewall = true;
  };
}
