# nvim5

Nicholas' AstroNvim v5 config. Minimal setup with copilot, prettier, trouble, and catppuccin. Leader key is `\`.

## Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/nichochar/nvim5 ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

Mason tools (lua-language-server, vtsls, stylua, selene, prettier) will auto-install on first launch.
