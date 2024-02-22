{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    phps.url = "github:loophp/nix-shell";
  };

  outputs = { self, nixpkgs, phps }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ phps.overlays.default ];
      };
    in
    {
      packages.${system} = {
        php56 = pkgs.php56;
        php82 = pkgs.php82;
      };
    };
}
