# NixOS-System

## TODOS:
### Neovim
- [ ] flash
    - [ ] Install Plugin
    - [ ] establish keybinding as <leader>


Plans are being made to make the config files more modular and useful for multiple profiles.

So far only my name is in there in ~/Profiles/Knosence/\*

## Editor ~/User/Editors/Neovim

## Shell ~/User/Shells/\* zsh | aliases

Uses Zsh with aliases.

## App Configs ~/User/App/\*

1. Cura (appimage)
2. git
3. kitty

## Ollama

Before using ollama, you will need to serve it first.

> $ sudo systemctl enable ollama
> $ sudo systemctl start ollama

or

Open 2 terms:

1. to run ollama serve
2. to use ollama run WhatEverModel
   ex.
   ollama run deepseek-coder
   ollama run codellama
   ollama run dolphin-mistral
   ollama run llama2-uncensored
   ollama run wizardcoder

