{ config, pkgs, ...}:
{
  networking.hostName = "joey";

  users.users.joey = {
    isNormalUser = true;
    description: "Joey";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  }

  system.stateVersion = "25.11";
}
