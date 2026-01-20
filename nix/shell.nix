{pkgs, ...} : pkgs.mkShell{
	packages = with pkgs; [
		(python3.withPackages(python-pkgs: [
		python-pkgs.ipython
		]))
		(texlive.combine {
			inherit (texlive) latexmk scheme-small amsmath titlesec;
		})
		(pkgs.writeShellScriptBin "buildlatex" ''
				${pkgs.texlivePackages.latexmk}/bin/latexmk -pdf "$1" && \
				${pkgs.texlivePackages.latexmk}/bin/latexmk -c "$1"
			'')
	];
	shellHook = ''
		# function buildlatex {
		# 	latexmk $1 && latexmk -c $1
		# }
		echo -- latex environment loaded --
	'';
}

