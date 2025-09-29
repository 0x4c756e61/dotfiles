{config,...}:
{
  home.file."${config.xdg.configHome}/fastfetch" = {
    source = config.lib.file.mkOutOfStoreSymlink "./dotfiles/fastfetch";
    recursive = true;
  };
}
