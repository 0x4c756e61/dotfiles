{config, ...}: {
  home.file."${config.xdg.configHome}/ghostty" = {
    source =  config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/ghostty/";
    recursive = true;
  };
}
