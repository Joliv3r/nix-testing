{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (texlive.combine {
      inherit (texlive)
      scheme-medium
      collection-latexextra
      tikz-cd
      ;
     })
  ];
}
