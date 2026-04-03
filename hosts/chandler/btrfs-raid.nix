{ config, pkgs, ... }: {
  boot.supportedFilesystems = [ "btrfs" ];
  environment.systemPackages = [ pkgs.btrbk ];

  services.btrbk.instances."tank" = {
    onCalendar = "weekly";
    settings = {
      snapshot_preserve_min = "7d";
      snapshot_preserve = "7d 4w 3m";
      volume = "/tank";
      snapshot_dir = "/tank/.snapshots";
    };
  };
}
