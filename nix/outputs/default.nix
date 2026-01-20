{pkgs, ...} : {
	ue33_correction = pkgs.callPackage ../latexderiv.nix {
		name = "correction";
		filepath = "./systems/net/correction/main.tex";
	};
}
