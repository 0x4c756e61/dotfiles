{config,...}:
{
  home.file."${config.xdg.configHome}/fastfetch" = {
    source =  config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/fastfetch/";
    recursive = true;
  };
}
