{
  spicetify,
  config,
  pkgs,
  ...
}:
{
  programs.spicetify =
    let
      spicePkgs = spicetify.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = true;
      wayland = true;

      theme = spicePkgs.themes.turntable;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        autoVolume
        playNext
        fullAppDisplay
      ];

      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];
    };

  home.packages = with pkgs; [
    (config.lib.nixGL.wrap (
      spotube.overrideAttrs rec {
        version = "5.1.0";
        src = (
          fetchurl {
            name = "Spotube-${version}-linux-x86_64.deb";
            url = "https://github.com/KRTirtho/spotube/releases/download/v${version}/Spotube-linux-x86_64.deb";
            hash = "sha256-tCuOhThuyIcjJJyIpbpK+3eTCfrQMsIiNt3jZxYL5pU=";
          }
        );
      }
    ))
  ];

  warnings = [
    "Comment out spotify/spicetify if not used anymore"
  ];
}
