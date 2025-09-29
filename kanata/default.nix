{config, ...}: {
  home.file."${config.xdg.configHome}/kanata/config.kbd" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/kanata/config.kbd";
  };
}
