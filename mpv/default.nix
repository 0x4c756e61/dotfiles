{ config, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/mpv" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/mpv/";
    recursive = true;
  };

  home.packages = with pkgs; [
    (config.lib.nixGL.wrap (
      mpv.override {
        scripts = with pkgs.mpvScripts; [
          mpris
          uosc
          thumbfast
          quality-menu
        ];
      }
    ))
  ];
}
