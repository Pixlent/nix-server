{ config, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
    ./btrfs-raid.nix
    ./../../modules/caddy/default.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "chandler";

  users.users.chandler = {
    isNormalUser = true;
    description = "Chandler";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    btrfs-progs
  ];

  system.stateVersion = "25.11";
}
