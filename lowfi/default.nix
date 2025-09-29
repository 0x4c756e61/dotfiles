{config, ...}: {
  home.file."${config.xdg.dataHome}/lowfi/chillhop.txt" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/lowfi/chillhop.txt";
  };
}
