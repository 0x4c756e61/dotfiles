{config, ...}: {
  home.file."${config.xdg.configHome}/zed/" = {
    source =  config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/zed/";
    recursive = true;
  };
}
