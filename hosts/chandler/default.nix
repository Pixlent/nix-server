{ config, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "chandler";

  users.users.chandler = {
    isNormalUser = true;
    description = "Chandler";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  system.stateVersion = "25.11";
}
