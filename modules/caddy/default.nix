{ pkgs, config, ... }:
let
  caddyWithCloudflare = pkgs.caddy.override {
    externalPlugins = [{
      name = "cloudflare";
      repo = "github.com/caddy-dns/cloudflare";
      version = "master";
    }];
    vendorHash = "";
  };
in {
  services.caddy = {
    enable = true;
    package = caddyWithCloudflare;
    globalConfig = ''
      {
        acme_dns cloudflare {$CLOUDFLARE_API_TOKEN}
      }
    '';
    virtualHosts = {
      "jellyfin.pixlent.me" = {
        extraConfig = ''
          reverse_proxy http://10.0.0.184:8096
        ''
      }
    }
  };

  systemd.services.caddy.serviceConfig.EnvironmentFile = "/etc/caddy/secrets.env";

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
