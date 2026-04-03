{ config, pkgs, ... }: {
  boot.supportedFilesystems = [ "btrfs" ];

  # Pre-format first: mkfs.btrfs -f -d raid1 -m raid1 /dev/disk/by-id/scsi-0QEMU...1 /dev/disk/by-id/scsi-0QEMU...2

  fileSystems."/tank" = {
    device = "/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi1";
    fsType = "btrfs";
    options = [ "defaults" "compress=zstd:1" "noatime" "space_cache=v2" ];
  };

  services.btrbk.instances."tank" = {
    onCalendar = "daily";
    path = "/tank";
    target = "/tank/.snapshots";
    snapshotDir = "/tank/.snapshots";
    settings = {
      snapshot_preserve_min = "7d";
      snapshot_preserve = "7d 4w 3m";
      preserve_snapshots = true;
    };
  };
}
