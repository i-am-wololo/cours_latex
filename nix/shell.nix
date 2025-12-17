{pkgs, ...} : pkgs.mkShell{
	packages = with pkgs; [
		(python3.withPackages(python-pkgs: [
		python-pkgs.ipython
		]))
		(texlive.combine {
			inherit (texlive) scheme-small amsmath titlesec;
		})
	];
}

