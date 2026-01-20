{pkgs, stdenv, name, filepath} : stdenv.mkDerivation {
		name = name;
		src = ../.;
		buildInputs = with pkgs; [
			coreutils
			(texlive.combine {
				inherit (texlive) scheme-small amsmath titlesec latexmk;
			})
		];

		buildPhase = ''
			mkdir -p .cache/texmf-var
			env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var latexmk ${filepath} -pdf -lualatex -interaction=nonstopmode -cd ${filepath};
		'';

		postBuild = ''
			mkdir -p $out
			cp *pdf $out
		'';
		
}
