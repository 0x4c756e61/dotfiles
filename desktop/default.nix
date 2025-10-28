{ config,pkgs,mangowc, ... }:
{
  wayland.windowManager.mango = {
    enable = true;
    package = (config.lib.nixGL.wrap mangowc.packages.${pkgs.stdenv.hostPlatform.system}.default);
    systemd.enable = true;
  };
}
