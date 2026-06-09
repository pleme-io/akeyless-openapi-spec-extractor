{
  description = "CLI tool for extracting single endpoints from OpenAPI specs with all endpoint details";
  inputs = {
    nixpkgs.follows = "substrate/nixpkgs";
    substrate = { url = "github:pleme-io/substrate";};
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    builder = "package";
    pname = "akeyless-openapi-spec-extractor";
    npmDepsHash = "sha256-VSFu7jZapXDzkPP2HKdin1XgvCXepRvxervzrJkTf34=";
    dontNpmBuild = true;
    description = "CLI tool for extracting single endpoints from OpenAPI specs with all endpoint details";
  };
}
