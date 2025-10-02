{config, ...}: {
  home.file."${config.xdg.configHome}/kwingestures.yml".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/singlefile configs/kwingestures.yml";
  home.file."${config.xdg.configHome}/kwinrulesrc".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/singlefile configs/kwinrulesrc";
 }
