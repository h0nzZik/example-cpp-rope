{
  description = "A library for ropes";

  inputs.nixpkgs.url = "nixpkgs/master";

  outputs = { self, nixpkgs }:
    let

      version = "0.1.0";

      # System types to support.
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });

    in

    {

      # A Nixpkgs overlay.
      overlay = final: prev: {

        cpprope = with final; gcc13Stdenv.mkDerivation rec {
          pname = "cpprope";
          inherit version;

          src = ./.;

          nativeBuildInputs = [
            gnumake
            clang-tools_17
            #gcc13
            #libstdcxx5
            python311Packages.compiledb
            #llvmPackages_17.libcxxClang
            llvmPackages_17.clangUseLLVM
          ];

          buildInputs = [
            doctest
            #catch2_3
            catch2
            microsoft-gsl
          ];

          hardeningDisable = [ "all" ];
        };

      };

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system:
        {
          inherit (nixpkgsFor.${system}) cpprope;
        });

      # The default package for 'nix build'. This makes sense if the
      # flake provides only one package or there is a clear "main"
      # package.
      defaultPackage = forAllSystems (system: self.packages.${system}.cpprope);

      devShells = forAllSystems (system: {
        cpprope =
        let
          cpprope = self.outputs.packages.${system}.cpprope;
        in
          (nixpkgsFor.${system}).mkShell.override { stdenv = (nixpkgsFor.${system}).gcc13Stdenv;  } {
            inputsFrom = [cpprope];
            packages = [];
            hardeningDisable = [ "all" ];
          };
      });

   };
}
