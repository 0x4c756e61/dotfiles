{config, pkgs, ...}: {
  home.file."${config.xdg.configHome}/fish/" = {
    source =  config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/fish/";
    recursive = true;
  };

  home.packages = with pkgs; [
    fish
    fishPlugins.fzf-fish
    fishPlugins.autopair
    fishPlugins.forgit
  ];
}
