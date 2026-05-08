{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      fontsConf = pkgs.makeFontsConf {
        fontDirectories = with pkgs; [
          jetbrains-mono
        ];
      };
    in
    {
      devShell = pkgs.mkShell {
        packages = with pkgs; [
          typst
          uv
        ];

        shellHook = ''
          export FONTCONFIG_FILE="${fontsConf}"
        '';
      };
    }
  );
}
