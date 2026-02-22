{
  description = "Go + GTK4 dev shell (Hello World)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            go
            pkg-config

            gtk4
            glib
            gobject-introspection
            cairo
            pango
            graphene
            gdk-pixbuf
          ];

          # Helpful so cgo can find headers/libs via pkg-config.
          # Usually not required, but it can reduce “cannot find -l…” issues.
          shellHook = ''
            echo "Go GTK4 dev shell"
            export CGO_ENABLED=1
          '';
        };
      });
}
