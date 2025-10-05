{config, ...}: {
  home.file."${config.xdg.configHome}/zed/" = {
    source =  config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/zed/config/";
    recursive = true;
  };

  home.file."${config.xdg.dataHome}/zed/extensions/index.json".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/zed/extensions.json";
}
