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
6. Git
7. Indent-blankline
8. lightline (inactive)
9. lsp
    
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

10. lualine (active)
11. Noice
12. None-ls
13. Nvim-tree
14. options (where options live)
15. startify (active)
16. telescope
17. treesitter
18. vimPlugins

| pos  | Vim Plugin   |
| --- | ------------ |
| a.  | Ionide-vim   |
| b.  | vim-astro    |
| c.  | dressing-vim |

19. wilder
20. multicursors

Everything is wired into default.nix file

## Shell ~/User/Shells/* zsh | aliases

Uses Zsh with aliases.

## App Configs ~/User/App/*
1. Cura (appimage)
2. git 
3. kitty
