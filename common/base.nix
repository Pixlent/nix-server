{ config, pkgs, ...}:
{
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  #i18n.defaultLocate = "en_US.UTF-8";

  # Configure keymap in X11
  #services.xserver.xkb = {
  #  layout = "no";
  #  variant = "";
  #};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    pciutils
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
