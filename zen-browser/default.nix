{
  config,
  pkgs,
  zen-browser,
  ...
}:
let
  custom-zen =
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta-unwrapped.overrideAttrs
      (oldAttrs: rec {
        libName = "zen-bin-*";
        fsautoconfig = (
          builtins.fetchurl {
            url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/program/config.js";
            sha256 = "1mx679fbc4d9x4bnqajqx5a95y1lfasvf90pbqkh9sm3ch945p40";
          }
        );
        configpref = (
          builtins.fetchurl {
            url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/refs/heads/master/program/defaults/pref/config-prefs.js";
            sha256 = "sha256-a/0u0TnRj/UXjg/GKjtAWFQN2+ujrckSwNae23DBfs4=";
          }
        );

        postInstall = (oldAttrs.postInstall or "") + ''
          chmod -R u+w "$out/lib/${libName}"
          cp "${fsautoconfig}" "$out/lib/${libName}/config.js"
          mkdir -p "$out/lib/${libName}/defaults/pref"
          cp "${configpref}" "$out/lib/${libName}/defaults/pref/config-pref.js"
        '';
      });
in
{

  # Zen beta, best firefox fork
  programs.zen-browser = {
    enable = true;
    package = (
      config.lib.nixGL.wrap (
        (pkgs.wrapFirefox) custom-zen {
          icon = "zen-browser";
        }
      )
    );
  };
  warnings = [ "fix and update zine installation" ];
}
