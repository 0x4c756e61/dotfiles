{
  config,
  pkgs,
  ...
}:{
  home.packages = with pkgs; [
    # -- Image editing
    (config.lib.nixGL.wrap gimp3)
    # --

    # -- Audio and video
    qpwgraph
   (config.lib.nixGL.wrap easyeffects)
    # --
  ]
}
