{pkgs, ...} : pkgs.mkShell{
	packages = with pkgs; [
		(texlive.combine {
			inherit (texlive) scheme-basic titlesec lipsum;
		})
		(python3.withPackages(python-pkgs: [
		python-pkgs.ipython
		]))
	];
}

