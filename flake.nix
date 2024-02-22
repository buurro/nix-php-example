{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    phps = {
      url = "github:loophp/nix-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
