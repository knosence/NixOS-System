# NixOS-System

Plans are being made to make the config files more modular and useful for multiple profiles.

So far only my name is in there in ~/Profiles/Knosence/*

## Editor ~/User/Editors/Nixvim/*

First and foremost: The most important tool in my arsenal: The Editor: Neovim,

The particular version is built for NixOS called Nixvim,

Neovim's Features:

1. Alpha (inactive)
2. Auto-pairs
3. Bufferline
4. CMP
5. Comment
6. fidget
7. Git
8. Indent-blankline
9. lightline (inactive)
10. lint
11. lsp

| pos  | Language server |
| --- | --------------- |
| a.  | bashls          |
| b.  | clangd          |
| c.  | gopls           |
| d.  | nil_ls          |
| e.  | lua-ls          |
| f.  | rust-analyzer   |
| g.  | html            |
| h.  | astro           |
| i.  | tailwindcss     |
| j.  | tsserver        |
| k.  | prismals        |
| l.  | dockerls        |
| m.  | cssls           |
| n.  | emmet_ls        |
| o.  | eslint          |
| p.  | marksman        |

12. lualine (active)
13. multicursors
14. neo-tree
15. Noice
16. None-ls
17. Nvim-tree
18. options (where options live)
19. startify (inactive)
20. telescope
21. toggleterm
22. treesitter
23. vimPlugins

| pos  | Vim Plugin       |
| --- | ----------------- |
| a.  | Ionide-vim        |
| b.  | vim-astro         |
| c.  | dressing-vim      |
| d.  | nui-vim           |
| e.  | nvim-web-devicons |
| f.  | plenary-vim       |

19. wilder

Everything is wired into default.nix file

## Shell ~/User/Shells/* zsh | aliases

Uses Zsh with aliases.

## App Configs ~/User/App/*

1. Cura (appimage)
2. git
3. kitty
