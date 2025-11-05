{ config, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/zed/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/dotfiles/zed/";
    recursive = true;
  };

  programs.zed-editor = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.zed-editor);

    extensions = [
      "catppuccin"
      "catppuccin-blur"
      "catppuccin-icons"
      "colorizer"
      "csharp"
      "cucumber"
      "discord-presence"
      "docker-compose"
      "dockerfile"
      "emmet"
      "fish"
      "fleet-themes"
      "git-firefly"
      "jsonl"
      "github-dark-default"
      "github-theme"
      "glsl"
      "html"
      "log"
      "macos-classic"
      "make"
      "markdown-oxide"
      "material-dark"
      "nextjs-react-snippets"
      "nginx"
      "nix"
      "nvim-nightfox"
      "palenight"
      "php"
      "prisma"
      "proto"
      "python-snippets"
      "qml"
      "ruff"
      "scss"
      "serendipity"
      "sql"
      "superhtml"
      "svelte"
      "svelte-snippets"
      "terraform"
      "toml"
      "twig"
      "typst"
      "vscode-dark-plus"
      "vscode-great-icons"
      "vscode-icons"
      "vue"
      "xcode-themes"
      "zedokai"
      "zedwaita"
      "zig"
      "ziggy"
    ];

    extraPackages = with pkgs; [
      nixd
      nil
    ];
  };

}
