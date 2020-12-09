{pkgs ? null} @ args:
let
  pinnedNixpkgsSrc = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/13f19ce5d43edd43dd8efc8166105003e74ad520.tar.gz";
    # Get this info from the output of: `nix-prefetch-url --unpack $url` where `url` is the above.
    sha256 = "1lrsxm9rh7g0vxf5bsllwpcd4idgxmlnr96x1srhslcxv77d6l0d";
  };

  pinnedNixpkgs = import pinnedNixpkgsSrc { config = {}; };

  pkgs = if args ? "pkgs" then args.pkgs else pinnedNixpkgs;
in

with pkgs;

mkShell {
  name = "garmin-experiment-env";
  buildInputs = [
    saxon-he
    libxml2
    garmintools
  ];

  shellHook = ''
    export "PATH=${builtins.toString ./.}/bin:$PATH"
  '';
}
