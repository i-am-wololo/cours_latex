{self, pkgs, ...} : pkgs.stdenNoCC.mkDerivation {
	name = "cours latex";
	src = self;
}
