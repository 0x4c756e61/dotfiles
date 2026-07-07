{
  config,
  pkgs,
  moonlight,
  ...
}: {
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap signal-desktop)
    (config.lib.nixGL.wrap dissent)
    (config.lib.nixGL.wrap (
      discord.override {
        #withMoonlight = true;
        # withOpenASAR = true;
        moonlight = moonlight.packages.${pkgs.stdenv.hostPlatform.system}.moonlight;
        desktopName = "moonlight";
        commandLineArgs = "--ozone-platform=wayland"; # Seems to be required on non-nixOS installations? Not sure since the package already appends this if NIXOS_WAYLAND is set
      }
    ))

  ]
}
