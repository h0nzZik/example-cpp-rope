{
  description = "An over-engineered Hello World in C";

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

        cpprope = with final; stdenv.mkDerivation rec {
          pname = "cpprope";
          inherit version;

          src = ./.;

          nativeBuildInputs = [
            build2
            bdep
            bpkg
            microsoft-gsl
          ];
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

      # Tests run by 'nix flake check' and by Hydra.
      checks = forAllSystems
        (system:
          with nixpkgsFor.${system};

          {
            inherit (self.packages.${system}) cpprope;

            # Additional tests, if applicable.
            test = stdenv.mkDerivation {
              pname = "cpprope-test";
              inherit version;

              buildInputs = [ cpprope ];

              dontUnpack = true;

              buildPhase = ''
                echo 'running some integration tests'
                [[ $(cpprope) = 'Hello World!' ]]
              '';

              installPhase = "mkdir -p $out";
            };
          }
        );

    };
}
