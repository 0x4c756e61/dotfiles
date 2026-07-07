{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap monero-gui)
    (config.lib.nixGL.wrap kdePackages.akregator)
  ];
}
