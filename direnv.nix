
{
  # Automatically set and unset environments when switching directory
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

}
