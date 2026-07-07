{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap pods)
    nix-output-monitor
    xh
  ];
}
