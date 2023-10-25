# Path to your oh-my-zsh installation.
export ZSH="/home/admin/.oh-my-zsh"

ZSH_THEME=robbyrussell

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=($plugins git z zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting cp)

# # Configurez d'autres options Zsh (vous pouvez personnaliser ceci)
# setopt autocd
# setopt hist_ignore_space
# setopt extended_glob

source $ZSH/oh-my-zsh.sh
