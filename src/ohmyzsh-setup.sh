#!/bin/bash

export ZSH_CUSTOM="/home/utilisateur/.oh-my-zsh"

# Cloner Oh-My-Zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH_CUSTOM

# Cloner les plugins
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/custom/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/custom/plugins/zsh-autosuggestions
