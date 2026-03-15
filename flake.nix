{
  description = "CLI tool for extracting single endpoints from OpenAPI specs with all endpoint details";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.default = pkgs.buildNpmPackage {
        pname = "akeyless-openapi-spec-extractor";
        version = "0.0.0-dev";
        src = self;
        npmDepsHash = "sha256-VSFu7jZapXDzkPP2HKdin1XgvCXepRvxervzrJkTf34="; # TODO: set correct hash
        dontNpmBuild = true;
        meta = {
          description = "CLI tool for extracting single endpoints from OpenAPI specs with all endpoint details";
          homepage = "https://github.com/pleme-io/akeyless-openapi-spec-extractor";
          license = pkgs.lib.licenses.asl20;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
