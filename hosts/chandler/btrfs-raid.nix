{ config, pkgs, ... }: {
  boot.supportedFilesystems = [ "btrfs" ];
  environment.systemPackages = [ pkgs.btrbk ];

  fileSystems."/tank" = {
    device = "/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi1";
    fsType = "btrfs";
    options = [ "defaults" "compress=zstd:1" "noatime" "space_cache=v2" ];
  };

  services.btrbk.instances."tank" = {
    onCalendar = "daily";
    settings = {
      snapshot_preserve_min = "7d";
      snapshot_preserve = "7d 4w 3m";
      preserve_snapshots = "yes";    # ← String "yes", not true

      volume = "/tank";
      snapshot_dir = "/tank/.snapshots";
    };
  };
}
