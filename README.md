# jan-iwan Neovim config 

## Introduction

Here I host my configuration for nvim, used mainly for programming in C,
Python, Lua, etc; writing math documents in Latex and taking notes in markdown.
I try not to use an excessive amount of plugins and keep some sense of
simplicity.

I love neovim and like tinkering with config files. This configuration is not
based on any Neovim distribution nor any other config in particular, it's
a collection of many things I've found and revised or came up with. It is meant
to fit my needs the way I want to, so it won't necessarily work for anyone
else; it might be helpful though.

## Looks

The colorscheme used is [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim)
with some tweaks here and there and a dark background. The font is Terminus
(bitmap) [with some
patches](https://github.com/jan-iwan/dots/blob/main/z/bak/fonts/terminus.sh).

I like the UI to look simple and rather pixelated, so i avoid things (like
icons) that need antialiasing to be usable or decorative elements that I don't
find necessary. That's why i prefer to use the default startup screen.
<p align="center">
  <img src="https://github.com/jan-iwan/nvim-config/assets/125842224/908f52e9-1916-4676-88ee-35cb292947b6">
</p>

## Plugins

For the plugin manager, I use [lazy.nvim](https://github.com/folke/lazy.nvim).
Here is some of what I have:
- LSP setup with [mason.nvim](https://github.com/williamboman/mason.nvim).
- Completion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and custom [LuaSnip](https://github.com/L3MON4D3/LuaSnip) snippets.
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) fuzzy finder.
- [VimTeX](https://github.com/lervag/vimtex) for editing LaTeX. Syntax highlighting with
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (except for LaTeX, since it confilcts with vimtex).
- Colorful color codes using [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua).
- Note taking in Obsidian with [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim).
- [vim-pencil](https://github.com/preservim/vim-pencil) for prose oriented writing (markdown and LaTeX).
- [vim-mundo](https://github.com/simnalamburt/vim-mundo) for undo history and tree
- Last but not least, the _one and only_ file manager, Netrw!


<p align="center">
  <img src="https://github.com/jan-iwan/nvim-config/assets/125842224/9b8e9141-4ff7-47f1-acfb-72222bb23d93">
  <img src="https://github.com/jan-iwan/nvim-config/assets/125842224/896d7408-82a8-44aa-a57e-79f83e982582">
</p>
