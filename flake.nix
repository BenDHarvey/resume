{
  description = "Resume generation environment with Pandoc and LaTeX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Core tools
            pandoc
            texlive.combined.scheme-full

            # Additional useful tools
            watchexec # For auto-rebuilding on file changes
            entr # Another option for watching files
            fd # Fast alternative to find
            bat # Better cat with syntax highlighting
          ];

          # Shell hook to provide helpful info when entering the environment
          shellHook = ''
            echo "Resume generation environment activated!"
            echo ""
            echo "Available commands:"
            echo "  - Generate PDF:   pandoc resume.md --template=resume.tex -o ben-harvey_resume.pdf --pdf-engine=xelatex"
            echo "  - Watch changes:  watchexec -e md,tex \"pandoc resume.md --template=resume.tex -o ben-harvey_resume.pdf --pdf-engine=xelatex\""
            echo ""
            echo "Tip: Use the watch command to automatically rebuild when files change"
            echo ""
          '';
        };

        # Create a simple app to generate the resume
        apps.default = {
          type = "app";
          program = toString (pkgs.writeShellScript "generate-resume" ''
            ${pkgs.pandoc}/bin/pandoc resume.md --template=resume.tex -o ben-harvey_resume.pdf --pdf-engine=xelatex
            echo "Resume PDF generated!"
          '');
        };
      });
}
