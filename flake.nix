{
	description = "flake for latex notes";
	inputs = {
		nixpkgs.url = "nixpkgs";
	};

	outputs = {nixpkgs, ...}@inputs : {
		devShells.x86_64-linux.default = let
			pkgs = import nixpkgs {system = "x86_64-linux";};
		in pkgs.mkShell{
			packages = with pkgs; [
				texlive.combined.scheme-basic
				sage
				(python3.withPackages(python-pkgs: [
				python-pkgs.ipython
				]))
			];
		};
	};
}
