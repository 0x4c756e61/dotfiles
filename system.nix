{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    btop-rocm
    dysk
  ];
}
