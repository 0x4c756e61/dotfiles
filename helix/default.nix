{config, ...}: {
  home.file."${config.xdg.configHome}/helix" = {
    source =  config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/helix/";
    recursive = true;
  };
}
