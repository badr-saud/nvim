# Windows setup notes

This branch targets native Windows. It's the same config as `main`, with the
PDF viewer swapped from zathura (Linux-only) to SumatraPDF.

## PDF viewer

LaTeX forward search (vimtex + texlab) is configured to use SumatraPDF:

- `lua/plugins/vimtex.lua` — `vim.g.vimtex_view_method = "sumatrapdf"`
- `lua/plugins/lsp-config.lua` — `texlab.build.forwardSearch` uses
  `SumatraPDF -reuse-instance -forward-search %f %l %p`

Install SumatraPDF and make sure `SumatraPDF.exe` is on `PATH` (or replace
`"SumatraPDF"` in both files above with the full path to the executable).
For inverse search (Ctrl+click in the PDF jumping back to Neovim), configure
SumatraPDF's inverse-search command to call `nvim --headless` or your
preferred `nvim --remote` invocation — see `:help vimtex-view-general` and
SumatraPDF's `-inverse-search` documentation.

## Other prerequisites

- A C compiler on `PATH` for `nvim-treesitter` to build parsers (e.g. via
  `zig cc`, MSVC's `cl`, or mingw-w64's `gcc`) — set `vim.g.compiler_path` /
  treesitter's `compilers` option if the default isn't found
- `git` — used by lazy.nvim's bootstrap
- `ripgrep` (`rg`) — used by Telescope's `live_grep`
- Node.js + npm — `live-server.nvim` runs `npm install -g live-server` as its
  build step
- MiKTeX or TeX Live for Windows, providing `latexmk` and `xelatex` on `PATH`
- A Nerd Font installed and selected in your terminal (Windows Terminal,
  etc.) — used for icons in `alpha.lua`, `lualine.lua` and `neo-tree.lua`

See `linux` branch + `LINUX.md` for the Linux/WSL equivalent of this branch
(zathura instead of SumatraPDF, etc.).
