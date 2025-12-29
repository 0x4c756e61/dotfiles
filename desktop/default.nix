# -- unused, sticking to plasma for nows

{
  config,
  quickshell,
  pkgs,
  mangowc,
  awww,
  ...
}:
let
  qs = (
    config.lib.nixGL.wrap (
      quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default.override (_: {
        withX11 = false;
        # withI3 = false;
        # withHyprland = false; # No i don't think i will (see https://git.outfoxxed.me/quickshell/quickshell/src/commit/db1777c20b936a86528c1095cbcb1ebd92801402/src/wayland/hyprland/focus_grab/qml.cpp#L67)
      })
    )
  );
in
{

  wayland.windowManager.mango = {
    enable = true;
    package = (config.lib.nixGL.wrap mangowc.packages.${pkgs.stdenv.hostPlatform.system}.default);
    systemd.enable = true;
  };

  # programs.dankMaterialShell.enable = true;
  # programs.dankMaterialShell.quickshell.package = qs;

  home.packages = [
    qs
    awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];
}
