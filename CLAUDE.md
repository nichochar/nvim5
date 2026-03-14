# nvim5

Nicholas' AstroNvim v5 config. Minimal, no bloat.

## Philosophy

- Keep it simple: only add plugins and config that are actively used
- Everything should be in code: Mason tool installs are pinned in `mason.lua` so a fresh machine auto-installs everything
- No dead template files: AstroNvim ships starter templates with `if true then return {} end` guards — delete them rather than leaving them around
- Use modern tools: conform.nvim for formatting (not none-ls/null-ls which is obsolete), nvim-lint if linting is ever needed

## Structure

- `init.lua` — bootstraps lazy.nvim, then loads `lazy_setup` and `polish`
- `lua/lazy_setup.lua` — configures lazy.nvim with AstroNvim, community packs, and user plugins
- `lua/community.lua` — AstroCommunity imports (Lua pack, catppuccin theme)
- `lua/polish.lua` — post-setup hook (currently empty, required by init.lua)
- `lua/plugins/` — all user plugin configs:
  - `copilot.lua` — github/copilot.vim with custom Tab priority (Copilot > snippet > cmp > fallback)
  - `conform.lua` — prettier for JS/TS/CSS/HTML/JSON/YAML/Markdown
  - `mason.lua` — pins Mason packages: lua-language-server, vtsls, stylua, selene, prettier
  - `astrocore.lua` — vim options, keymaps, diagnostics
  - `astrolsp.lua` — LSP config, format-on-save enabled
  - `astroui.lua` — theme (catppuccin-macchiato), icons
  - `trouble.lua` — diagnostics panel

## Key decisions

- **copilot.vim over copilot.lua**: uses the official `github/copilot.vim`, NOT `zbirenbaum/copilot.lua`. Do NOT add `astrocommunity.completion.copilot-lua-cmp` to community.lua — the two conflict and cause "NotSignedIn" errors.
- **conform.nvim over none-ls**: formatting goes through conform, not the obsolete none-ls/null-ls bridge.
- **Format on save**: enabled globally in `astrolsp.lua`. Prettier handles web files, stylua handles Lua.
- **Leader key**: backslash `\`
