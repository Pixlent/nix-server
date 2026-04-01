{ config, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/jellyfin/default.nix
  ];

  # GPU setup
  hardware.graphics = {
      enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "joey";

  users.users.joey = {
    isNormalUser = true;
    description = "Joey";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  system.stateVersion = "25.11";
}
