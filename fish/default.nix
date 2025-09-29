{config, ...}: {
  home.file."${config.xdg.configHome}/fish/" = {
    source =  config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/fish/";
    recursive = true;
  };
}
