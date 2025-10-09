{spicetify, pkgs, ...}: {

  home.packages = with pkgs; [
    spotify
  ];

  programs.spicetify =
  let
    spicePkgs = spicetify.packages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;
    package = spicetify.packages.${pkgs.stdenv.hostPlatform.system}.default;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
    ];


  };



}
