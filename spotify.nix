{spicetify, pkgs, ...}: {
  programs.spicetify =
  let
    spicePkgs = spicetify.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;
    wayland = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      groupSession
      powerBar
      skipStats
      autoVolume
      history
      playNext
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
  };
}
