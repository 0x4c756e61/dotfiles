{config, ...}: {
  home.file."${config.xdg.configHome}/mpv" = {
    source =  config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/mpv/";
    recursive = true;
  };
}
