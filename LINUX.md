# Linux setup notes

This branch targets Linux (this also covers WSL). The config itself is the
same as `main`; this file just documents the environment this branch
assumes.

## PDF viewer

LaTeX forward search (vimtex + texlab) is configured to use `zathura`:

- `lua/plugins/vimtex.lua` — `vim.g.vimtex_view_method = "zathura"`
- `lua/plugins/lsp-config.lua` — `texlab.build.forwardSearch.executable = "zathura"`

Install it via your distro's package manager (e.g. `apt install zathura`,
`pacman -S zathura`) and make sure it's on `PATH`.

## Other prerequisites

- A C compiler (`gcc`/`clang`) — needed by `nvim-treesitter` to build parsers
- `git` — used by lazy.nvim's bootstrap
- `ripgrep` (`rg`) — used by Telescope's `live_grep`
- Node.js + npm — `live-server.nvim` runs `npm install -g live-server` as its
  build step
- A TeX distribution (e.g. TeX Live) providing `latexmk` and `xelatex` on
  `PATH`, used by vimtex/texlab
- A Nerd Font in your terminal — used for icons in `alpha.lua`, `lualine.lua`
  and `neo-tree.lua`

See `windows` branch + `WINDOWS.md` for the native-Windows equivalent of
this branch (SumatraPDF instead of zathura, etc.).
