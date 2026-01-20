{
	description = "flake for latex notes";
	inputs = {
		nixpkgs.url = "nixpkgs";
	};

	outputs = {nixpkgs, ...} :
	let
		pkgs = import nixpkgs {system = "x86_64-linux";};
	in {
		devShells.x86_64-linux.default = import ./nix/shell.nix {inherit pkgs;};
		# packages.x86_64-linux = import ./nix/outputs {inherit pkgs;};
	};
}
