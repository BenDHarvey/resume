# Resume Repository

This repository contains my professional resume in markdown format, along with tools to convert it to a nicely formatted PDF using Pandoc and LaTeX.

## Contents

- `resume.md` - The resume content in Markdown format
- `resume.tex` - LaTeX template for PDF generation
- `flake.nix` - Nix flake for reproducible build environment

## Requirements

To generate the PDF resume, you'll need either:

1. **Nix with flakes** (recommended): Provides a completely reproducible environment
2. **Manual setup**: Pandoc and a full LaTeX distribution (including XeLaTeX)

## Quick Start with Nix

If you have Nix with flakes support installed:

1. Clone this repository
   ```bash
   git clone https://github.com/username/resume.git
   cd resume
   ```

2. Enter the development environment
   ```bash
   nix develop
   ```

3. Generate the PDF
   ```bash
   pandoc resume.md --template=resume.tex -o resume.pdf --pdf-engine=xelatex
   ```

4. Alternatively, use the provided app directly
   ```bash
   nix run
   ```

## Manual Setup

If you don't use Nix:

1. Install required software:
   - **Pandoc**: Document converter
   - **TeX Live** (full): LaTeX distribution with XeLaTeX

   ```bash
   # Ubuntu/Debian
   sudo apt-get install pandoc texlive-full
   
   # macOS with Homebrew
   brew install pandoc
   brew install --cask mactex
   
   # Windows
   # Install from pandoc.org and miktex.org
   ```

2. Generate the PDF
   ```bash
   pandoc resume.md --template=resume.tex -o resume.pdf --pdf-engine=xelatex
   ```

## Updating Your Resume

1. Edit `resume.md` with your updated information
2. Regenerate the PDF as described above
3. If you want continuous rebuilding while editing, use:
   ```bash
   watchexec -e md,tex "pandoc resume.md --template=resume.tex -o resume.pdf --pdf-engine=xelatex"
   ```

## Customizing the Template

The `resume.tex` file contains the LaTeX template that controls the visual appearance of your resume. You can customize:

- Margins and page layout
- Font styles and sizes
- Colors and formatting
- Section styles

After making changes to the template, regenerate the PDF to see your changes.
