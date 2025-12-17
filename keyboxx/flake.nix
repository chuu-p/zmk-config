{
  description = "keyboxx development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";

    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        ahk_x11
      ];
      shellHook = ''
        exec fish -C "set hydro_symbol_start 'KBX'"
      '';
    };
  };
}
