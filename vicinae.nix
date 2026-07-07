{
  config,
  vicinae,
  pkgs,
  ...
}:
{
  # Free and open source Raycast reimplementation
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    package = (config.lib.nixGL.wrap vicinae.packages.${pkgs.stdenv.hostPlatform.system}.default);
  };

}
