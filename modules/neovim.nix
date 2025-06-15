{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };


  # Make sure lsps and other useful packages are present.
  environment.systemPackages = with pkgs; [
    pyright
    nil
    lua-language-server
    rust-analyzer
    texlab
    bash-language-server
    ccls
    tree-sitter
  ];
}
